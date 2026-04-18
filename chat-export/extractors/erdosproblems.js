// erdosproblems.com problem / forum thread extractor.
// Works for both /<N> problem pages and /forum/thread/<N> pages (which
// include the problem + comments). Math is MathJax v2.
(() => {
  // Build a map from rendered MathJax element -> LaTeX source from the
  // adjacent <script type="math/tex">.
  const mathMap = new Map();
  document.querySelectorAll('script[type^="math/tex"]').forEach(s => {
    const latex = s.textContent.trim();
    const isDisplay = (s.type || '').includes('display');
    let prev = s.previousSibling;
    while (prev && prev.nodeType === 3 && !prev.textContent.trim()) prev = prev.previousSibling;
    if (prev && prev.nodeType === 1) mathMap.set(prev, { latex, isDisplay });
  });
  function walk(node) {
    if (mathMap.has(node)) {
      const { latex, isDisplay } = mathMap.get(node);
      return isDisplay ? `\n$$${latex}$$\n` : `$${latex}$`;
    }
    if (node.nodeType === 3) return node.textContent;
    if (node.nodeType !== 1) return '';
    const tag = node.tagName;
    if (['SCRIPT', 'STYLE', 'NOSCRIPT'].includes(tag)) return '';
    if (node.classList && (node.classList.contains('MathJax_Preview') || node.classList.contains('MJXc-display'))) return '';
    let out = '';
    for (const child of node.childNodes) out += walk(child);
    if (['P', 'DIV', 'LI', 'H1', 'H2', 'H3', 'H4', 'H5', 'BR', 'TR', 'BLOCKQUOTE', 'ARTICLE', 'SECTION'].includes(tag)) out = '\n' + out + '\n';
    return out;
  }
  let text = walk(document.body);
  text = text.replace(/[ \t]+/g, ' ').replace(/\n{3,}/g, '\n\n').replace(/^[ \t]+|[ \t]+$/gm, '');
  return { provider: 'erdosproblems', url: location.href, title: document.title, text };
})()
