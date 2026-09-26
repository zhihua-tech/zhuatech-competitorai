/* Copyright 2026 上海如静知华信息科技有限公司 · https://www.zhuatech.cn/ */
const dialog = document.querySelector('#run-dialog');
const toast = document.querySelector('#toast');
document.querySelector('#run-open').addEventListener('click', () => dialog.showModal());
document.querySelector('#search').addEventListener('input', (event) => {
  const keyword = event.target.value.trim().toLowerCase();
  document.querySelectorAll('tbody tr').forEach(row => row.hidden = !row.dataset.keywords.toLowerCase().includes(keyword));
});
document.querySelector('#refresh').addEventListener('click', (event) => {
  event.currentTarget.textContent = '已更新'; setTimeout(() => event.currentTarget.textContent = '刷新', 900);
});
document.querySelector('#approve').addEventListener('click', () => {
  toast.classList.add('show'); setTimeout(() => toast.classList.remove('show'), 1800);
});
document.querySelector('#run-submit').addEventListener('click', async (event) => {
  event.preventDefault();
  const status = document.querySelector('#run-status');
  const payload = {subject: document.querySelector('#subject').value, scenario: document.querySelector('#scenario').value,
    confidenceFloor: 75, humanReview: document.querySelector('#human-review').checked, context: document.querySelector('#context').value};
  status.textContent = '正在运行本地演示规则…';
  try {
    const response = await fetch('/api/competitorai/run', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(payload)});
    if (!response.ok) throw new Error('backend unavailable');
    const result = await response.json(); status.textContent = result.status === 'REVIEW_READY' ? '分析完成，已进入人工复核队列' : '分析完成，需要启用人工复核';
  } catch (_) { status.textContent = payload.humanReview ? '本地演示完成，已进入人工复核队列' : '本地演示完成，需要启用人工复核'; }
  setTimeout(() => dialog.close(), 1300);
});
