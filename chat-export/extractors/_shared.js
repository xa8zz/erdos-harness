// Shared DOM→Markdown helpers loaded via `eval` by each site extractor.
// Assigned to window.__chatExport so extractors can reuse.
window.__chatExport = (() => {
  function convertKatex(clone) {
    clone.querySelectorAll('.katex').forEach(k => {
      const ann = k.querySelector('annotation[encoding="application/x-tex"]');
      const latex = ann ? ann.textContent.trim() : k.textContent.trim();
      const isDisplay = k.closest('.katex-display') != null;
      const wrap = isDisplay ? `\n\n$$${latex}$$\n\n` : `$${latex}$`;
      const target = isDisplay ? k.closest('.katex-display') : k;
      target.replaceWith(document.createTextNode(wrap));
    });
  }

  function convertMathJax(clone) {
    // MathJax v2: <span class="MathJax">...</span> immediately followed by
    // <script type="math/tex">LaTeX</script>. Replace the rendered element
    // with the raw LaTeX.
    clone.querySelectorAll('script[type^="math/tex"]').forEach(s => {
      const latex = s.textContent.trim();
      const isDisplay = (s.type || '').includes('display');
      const wrap = isDisplay ? `\n\n$$${latex}$$\n\n` : `$${latex}$`;
      let prev = s.previousSibling;
      while (prev && prev.nodeType === 3 && !prev.textContent.trim()) prev = prev.previousSibling;
      if (prev && prev.nodeType === 1) {
        prev.replaceWith(document.createTextNode(wrap));
        s.remove();
      } else {
        s.replaceWith(document.createTextNode(wrap));
      }
    });
    // Kill lingering MathJax preview/display artifacts
    clone.querySelectorAll('.MathJax_Preview, .MJXc-display, .MathJax_Display').forEach(e => e.remove());
  }

  function convertStructure(clone) {
    // Code blocks
    clone.querySelectorAll('pre').forEach(pre => {
      const code = pre.querySelector('code');
      const langClass = code ? Array.from(code.classList).find(c => c.startsWith('language-')) : '';
      const lang = langClass ? langClass.replace('language-', '') : '';
      const text = (code || pre).textContent;
      pre.replaceWith(document.createTextNode(`\n\n\`\`\`${lang}\n${text.replace(/\n$/, '')}\n\`\`\`\n\n`));
    });
    clone.querySelectorAll('code').forEach(c => {
      c.replaceWith(document.createTextNode('`' + c.textContent + '`'));
    });
    // Headers
    clone.querySelectorAll('h1,h2,h3,h4,h5,h6').forEach(h => {
      const level = parseInt(h.tagName[1]);
      h.replaceWith(document.createTextNode('\n\n' + '#'.repeat(level) + ' ' + h.textContent.trim() + '\n\n'));
    });
    // Lists
    clone.querySelectorAll('ul > li').forEach(li => li.insertAdjacentText('afterbegin', '- '));
    clone.querySelectorAll('ol').forEach(ol => Array.from(ol.children).forEach((li, i) => li.insertAdjacentText('afterbegin', `${i + 1}. `)));
    // Block-level spacing
    clone.querySelectorAll('p').forEach(p => p.insertAdjacentText('afterend', '\n\n'));
    clone.querySelectorAll('br').forEach(br => br.replaceWith(document.createTextNode('\n')));
    clone.querySelectorAll('li').forEach(li => li.insertAdjacentText('afterend', '\n'));
    // Emphasis
    clone.querySelectorAll('strong,b').forEach(e => e.replaceWith(document.createTextNode('**' + e.textContent + '**')));
    clone.querySelectorAll('em,i').forEach(e => e.replaceWith(document.createTextNode('*' + e.textContent + '*')));
    // Drop interactive chrome
    clone.querySelectorAll('button, [aria-hidden="true"], script, style, noscript').forEach(e => e.remove());
  }

  // Convert a message element to markdown text.
  function toMarkdown(msg) {
    const clone = msg.cloneNode(true);
    convertKatex(clone);
    convertMathJax(clone);
    convertStructure(clone);
    let txt = clone.textContent;
    txt = txt.replace(/[ \t]+/g, ' ').replace(/\n{3,}/g, '\n\n').trim();
    return txt;
  }

  // Scroll the chat container to the top repeatedly to trigger lazy-load of
  // older messages, until message count is stable.
  async function loadAllMessages(selector, { maxRounds = 10, waitMs = 400 } = {}) {
    const container = document.scrollingElement || document.documentElement;
    let prev = -1;
    for (let i = 0; i < maxRounds; i++) {
      const count = document.querySelectorAll(selector).length;
      if (count === prev) break;
      prev = count;
      container.scrollTo(0, 0);
      // Nudge common inner scrollers as well
      document.querySelectorAll('main, [class*="conversation"], [class*="messages"]').forEach(el => el.scrollTo && el.scrollTo(0, 0));
      await new Promise(r => setTimeout(r, waitMs));
    }
    container.scrollTo(0, container.scrollHeight);
  }

  return { toMarkdown, loadAllMessages };
})();
