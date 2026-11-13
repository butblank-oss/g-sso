/**
 * 지쏘 가계부 : 구글 시트 저장용 앱스 스크립트
 *
 * 쓰는 법
 * 1) 새 구글 시트를 만든다 (이름 예: 지쏘 가계부 데이터)
 * 2) 메뉴 [확장 프로그램] -> [Apps Script] 를 연다
 * 3) 원래 있던 코드를 지우고 이 파일 내용을 전부 붙여넣는다
 * 4) 아래 SECRET 값을 나만 아는 비밀번호로 바꾼다
 * 5) [배포] -> [새 배포] -> 유형: 웹 앱
 *      실행 사용자: 나 / 액세스 권한: 모든 사용자
 * 6) 나온 웹 앱 URL 과 SECRET 을 가계부 [설정] -> [동기화] 에 넣는다
 */

const SECRET = '여기를-나만-아는-비밀번호로-바꾸세요';

const TX_SHEET = '내역';
const CONF_SHEET = '설정';
const TX_HEADER = ['id', '날짜', '분류', '금액', '결제수단', '메모', '가맹점', '수정시각', '삭제됨'];

function doGet(e) {
  return handle_(e.parameter || {});
}

function doPost(e) {
  let body = {};
  try {
    body = JSON.parse(e.postData.contents);
  } catch (err) {
    return out_({ ok: false, error: '요청 형식이 잘못됐어요' });
  }
  return handle_(body);
}

function handle_(p) {
  if (p.key !== SECRET) return out_({ ok: false, error: '비밀번호가 맞지 않아요' });
  const lock = LockService.getScriptLock();
  lock.waitLock(20000);
  try {
    const ss = SpreadsheetApp.getActive();
    if (p.action === 'load') return out_({ ok: true, data: load_(ss) });
    if (p.action === 'save') {
      const merged = merge_(load_(ss), p.data || {});
      write_(ss, merged);
      return out_({ ok: true, data: merged });
    }
    return out_({ ok: false, error: '알 수 없는 요청이에요' });
  } finally {
    lock.releaseLock();
  }
}

function sheet_(ss, name, header) {
  let sh = ss.getSheetByName(name);
  if (!sh) {
    sh = ss.insertSheet(name);
    if (header) {
      sh.getRange(1, 1, 1, header.length).setValues([header]).setFontWeight('bold');
      sh.setFrozenRows(1);
    }
  }
  return sh;
}

function load_(ss) {
  const sh = sheet_(ss, TX_SHEET, TX_HEADER);
  const last = sh.getLastRow();
  const tx = [];
  if (last > 1) {
    const rows = sh.getRange(2, 1, last - 1, TX_HEADER.length).getValues();
    rows.forEach(function (r) {
      if (!r[0]) return;
      const d = r[1] instanceof Date ? Utilities.formatDate(r[1], 'Asia/Seoul', 'yyyy-MM-dd') : String(r[1]);
      tx.push({
        id: String(r[0]), date: d, cat: String(r[2]), amount: Number(r[3]) || 0,
        pay: String(r[4]), memo: String(r[5]), merchant: String(r[6]),
        updatedAt: Number(r[7]) || 0, deleted: r[8] === true || r[8] === 'TRUE'
      });
    });
  }
  const conf = sheet_(ss, CONF_SHEET, null);
  let settings = null;
  const raw = conf.getRange(1, 1).getValue();
  if (raw) {
    try { settings = JSON.parse(raw); } catch (err) { settings = null; }
  }
  return { tx: tx, settings: settings };
}

function merge_(server, client) {
  const map = {};
  (server.tx || []).forEach(function (t) { map[t.id] = t; });
  (client.tx || []).forEach(function (t) {
    const old = map[t.id];
    if (!old || (t.updatedAt || 0) >= (old.updatedAt || 0)) map[t.id] = t;
  });
  const tx = Object.keys(map).map(function (k) { return map[k]; });
  tx.sort(function (a, b) { return a.date < b.date ? -1 : a.date > b.date ? 1 : 0; });
  let settings = server.settings;
  if (client.settings && (!settings || (client.settings.updatedAt || 0) >= (settings.updatedAt || 0))) {
    settings = client.settings;
  }
  return { tx: tx, settings: settings };
}

function write_(ss, data) {
  const sh = sheet_(ss, TX_SHEET, TX_HEADER);
  const last = sh.getLastRow();
  if (last > 1) sh.getRange(2, 1, last - 1, TX_HEADER.length).clearContent();
  const rows = data.tx.map(function (t) {
    return [t.id, t.date, t.cat, t.amount, t.pay || '', t.memo || '', t.merchant || '', t.updatedAt || 0, !!t.deleted];
  });
  if (rows.length) sh.getRange(2, 1, rows.length, TX_HEADER.length).setValues(rows);
  const conf = sheet_(ss, CONF_SHEET, null);
  conf.getRange(1, 1).setValue(JSON.stringify(data.settings || null));
}

function out_(obj) {
  return ContentService.createTextOutput(JSON.stringify(obj)).setMimeType(ContentService.MimeType.JSON);
}
