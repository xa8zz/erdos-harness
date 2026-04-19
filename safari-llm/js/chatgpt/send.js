// ChatGPT: type into prompt box and click send.
async function __send(text) {
  const input = document.querySelector('#prompt-textarea, div[contenteditable="true"].ProseMirror');
  if (!input) throw new Error('ChatGPT input element not found');
  input.focus();
  // Clear existing text then insert
  document.execCommand('selectAll', false, null);
  document.execCommand('delete', false, null);
  document.execCommand('insertText', false, text);
  // Wait for send button to become enabled (appears once text is present)
  const deadline = Date.now() + 6000;
  while (Date.now() < deadline) {
    const btn = document.querySelector('button[data-testid="send-button"]');
    if (btn && !btn.disabled) {
      btn.click();
      return { ok: true, chars: text.length };
    }
    await new Promise(r => setTimeout(r, 80));
  }
  throw new Error('ChatGPT send button did not enable within 6s');
}
