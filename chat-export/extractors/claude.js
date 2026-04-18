// Claude (claude.ai) conversation extractor.
// Users: [data-testid="user-message"]
// Assistant: .font-claude-response (also legacy .font-claude-message)
// Math: KaTeX.
(async () => {
  const SELECTOR = '[data-testid="user-message"], .font-claude-response, .font-claude-message';
  await window.__chatExport.loadAllMessages(SELECTOR);
  const out = [];
  document.querySelectorAll(SELECTOR).forEach(n => {
    const role = n.matches('[data-testid="user-message"]') ? 'user' : 'assistant';
    const text = window.__chatExport.toMarkdown(n);
    if (text) out.push({ role, text });
  });
  return { provider: 'Claude', url: location.href, title: document.title, messages: out };
})()
