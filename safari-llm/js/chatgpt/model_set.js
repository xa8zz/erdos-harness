// Set ChatGPT model by substring match of visible label.
async function __model_set(name) {
  const btn = document.querySelector('button[data-testid="model-switcher-dropdown-button"]');
  if (!btn) throw new Error('model switcher not found');
  btn.click();
  // Wait for menu to render
  const deadline = Date.now() + 4000;
  let items = [];
  while (Date.now() < deadline) {
    // Scope to the menu popover — searching the whole document would match the
    // trigger button itself (which has data-testid="model-switcher-..." and text
    // that is the CURRENT model label, not a menu item).
    items = [...document.querySelectorAll('[role="menu"] [role="menuitem"], [role="menu"] [role="menuitemradio"], [role="menu"] [role="menuitemcheckbox"], [role="menu"] [role="option"]')];
    if (items.length) break;
    await new Promise(r => setTimeout(r, 60));
  }
  if (!items.length) throw new Error('model menu did not open');
  const needle = name.toLowerCase();
  const target = items.find(el => (el.textContent || '').toLowerCase().includes(needle));
  if (!target) {
    // Close menu
    document.body.click();
    throw new Error(`no model matching ${JSON.stringify(name)}; available: ${items.map(i => (i.textContent||'').trim().slice(0,40)).join(' | ')}`);
  }
  target.click();
  await new Promise(r => setTimeout(r, 300));
  return { ok: true, selected: (target.textContent || '').trim().slice(0, 80) };
}
