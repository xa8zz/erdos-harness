// Single-shot probe for ChatGPT generation state. Cheap, synchronous.
const last = [...document.querySelectorAll('[data-message-author-role="assistant"]')].pop();
const text = last ? last.innerText : '';
return {
  streaming: !!(document.querySelector('button[data-testid="stop-button"]') ||
                document.querySelector('[data-message-author-role="assistant"] .result-thinking')),
  len: text.length,
  bodyLen: document.body.innerText.length,
  hidden: document.hidden
};
