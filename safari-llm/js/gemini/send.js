// Gemini: type into Quill prompt box and click send.
async function __send(text) {
  const input = document.querySelector('.ql-editor[contenteditable="true"]');
  if (!input) throw new Error('Gemini input element not found');
  input.focus();
  document.execCommand('selectAll', false, null);
  document.execCommand('delete', false, null);
  document.execCommand('insertText', false, text);
  const deadline = Date.now() + 6000;
  while (Date.now() < deadline) {
    const btn = document.querySelector('button[aria-label="Send message"]');
    if (btn && !btn.disabled && btn.getAttribute('aria-disabled') !== 'true') {
      btn.click();
      return { ok: true, chars: text.length };
    }
    await new Promise(r => setTimeout(r, 80));
  }
  throw new Error('Gemini send button did not enable within 6s');
}
