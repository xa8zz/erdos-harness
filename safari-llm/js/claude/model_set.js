// Set Claude model by substring match.
async function __model_set(name) {
  const btn = document.querySelector('button[data-testid^="model"]');
  if (!btn) throw new Error('model switcher not found');
  btn.click();
  const deadline = Date.now() + 4000;
  let items = [];
  while (Date.now() < deadline) {
    items = [...document.querySelectorAll('[role="menuitem"], [role="menuitemradio"], [role="menuitemcheckbox"], [role="option"]')];
    if (items.length) break;
    await new Promise(r => setTimeout(r, 60));
  }
  if (!items.length) throw new Error('model menu did not open');
  const needle = name.toLowerCase();
  const target = items.find(el => (el.textContent || '').toLowerCase().includes(needle));
  if (!target) {
    document.body.click();
    throw new Error(`no model matching ${JSON.stringify(name)}; available: ${items.map(i => (i.textContent||'').trim().slice(0,40)).join(' | ')}`);
  }
  target.click();
  await new Promise(r => setTimeout(r, 300));
  return { ok: true, selected: (target.textContent || '').trim().slice(0, 80) };
}
