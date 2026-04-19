// Set Gemini mode (Pro / Flash / Deep Think) by substring match.
async function __model_set(name) {
  const btn = document.querySelector('[data-test-id="bard-mode-menu-button"]');
  if (!btn) throw new Error('mode menu button not found');
  btn.click();
  const deadline = Date.now() + 4000;
  let items = [];
  while (Date.now() < deadline) {
    items = [...document.querySelectorAll('button[mat-menu-item], [role="menuitem"], [role="menuitemradio"]')];
    if (items.length) break;
    await new Promise(r => setTimeout(r, 60));
  }
  if (!items.length) throw new Error('mode menu did not open');
  const needle = name.toLowerCase();
  const target = items.find(el => (el.textContent || '').toLowerCase().includes(needle));
  if (!target) {
    document.body.click();
    throw new Error(`no mode matching ${JSON.stringify(name)}; available: ${items.map(i => (i.textContent||'').trim().slice(0,40)).join(' | ')}`);
  }
  target.click();
  await new Promise(r => setTimeout(r, 300));
  return { ok: true, selected: (target.textContent || '').trim().slice(0, 80) };
}
