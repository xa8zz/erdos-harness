// Gemini (gemini.google.com) conversation extractor.
// Uses the custom elements <user-query> and <model-response>.
// Math: KaTeX.
(async () => {
  const SELECTOR = 'user-query, model-response';
  await window.__chatExport.loadAllMessages(SELECTOR);
  const out = [];
  document.querySelectorAll(SELECTOR).forEach(n => {
    const role = n.tagName.toLowerCase() === 'user-query' ? 'user' : 'assistant';
    const text = window.__chatExport.toMarkdown(n);
    if (text) out.push({ role, text });
  });
  return { provider: 'Gemini', url: location.href, title: document.title, messages: out };
})()
