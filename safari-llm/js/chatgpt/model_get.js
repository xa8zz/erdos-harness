// Read currently-selected ChatGPT model.
// The trigger button's text is the auto-router label (usually "ChatGPT") and does
// NOT reflect sub-selection (Instant/Thinking/Pro). To get the actual sub-model,
// open the menu, read which menuitemradio has aria-checked="true", close menu.
async function __model_get() {
  const btn = document.querySelector('button[data-testid="model-switcher-dropdown-button"]');
  if (!btn) return { ok: false, err: 'model switcher not found' };
  const labelText = (btn.textContent || '').trim();
  btn.click();
  const deadline = Date.now() + 3000;
  let radios = [];
  while (Date.now() < deadline) {
    radios = [...document.querySelectorAll('[role="menu"] [role="menuitemradio"]')];
    if (radios.length) break;
    await new Promise(r => setTimeout(r, 60));
  }
  const selected = radios.find(r => r.getAttribute('aria-checked') === 'true');
  document.body.click();  // close menu
  return {
    ok: true,
    label: labelText,
    selected: selected ? (selected.textContent || '').trim() : null,
    options: radios.map(r => (r.textContent || '').trim().slice(0, 60))
  };
}
return __model_get();
