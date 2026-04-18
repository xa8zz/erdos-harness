// ChatGPT (chatgpt.com) conversation extractor.
// Messages: [data-message-author-role] with role attribute "user"/"assistant"/"tool".
// Math: KaTeX with <annotation encoding="application/x-tex">.
(async () => {
  const SELECTOR = '[data-message-author-role]';
  await window.__chatExport.loadAllMessages(SELECTOR);
  const out = [];
  document.querySelectorAll(SELECTOR).forEach(msg => {
    const role = msg.getAttribute('data-message-author-role');
    const text = window.__chatExport.toMarkdown(msg);
    if (text) out.push({ role, text });
  });
  return { provider: 'ChatGPT', url: location.href, title: document.title, messages: out };
})()
