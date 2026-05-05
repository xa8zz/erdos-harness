# Paper Review Findings - 2026-04-21

This document compiles the actionable findings from the multi-agent paper review
of the current `erdos-872/paper` draft.  The review focused on the headline
numerical certificate, the Section 7 main upper-bound proof chain, and release
hygiene for the manuscript folder.

## Executive Summary

The current paper compiles, and the reviewers did not find a new fatal break in
the main proof chain.  The remaining issues are concentrated in three repair
areas:

1. The Appendix B numerical certificate is overstated relative to the checked-in
   script.
2. The Section 7 prime-rounding bridge needs an explicit truncated-bin demand
   case.
3. `DRAFT_STATUS.md` is stale and no longer reflects the current paper layout or
   build output.

## Findings

| ID | Priority | Location | Status | Recommended Action |
| --- | --- | --- | --- | --- |
| F1 | P1 | `sections/appendix-B-numerical.tex:70-76` | Open | Either implement full interval-convolution recomputation in `scripts/wfour_certification.py`, or reword Appendix B to say the script checks an archived transcript and add the generation log/artifact. |
| F2 | P2 | `sections/07-main-upper-bound.tex:1050-1062` | Open | Add a truncated-interval version of the bin-demand estimate, or explicitly prove the final truncated source bin is dominated by the next prime bin. |
| F3 | P2 | `DRAFT_STATUS.md:8-21` | Open | Refresh the section inventory, page count, build status, and remaining-human-work list to match the current manuscript. |

## Detailed Notes

### F1 - Certificate Script Does Not Reproduce Intervals

Appendix B says the Python script uses directed interval arithmetic and default
parameters to reproduce the displayed `J_r` intervals.  The checked-in
`scripts/wfour_certification.py` currently hard-codes those interval endpoints
and only verifies the final inequality
`W_4/2 < 0.19`.

This is a submission blocker because the headline theorem depends on the
numerical certificate.  There are two acceptable repair paths:

- Implement the actual outward-rounded convolution computation in
  `scripts/wfour_certification.py` so running the script reproduces the
  displayed intervals.
- Keep the script as a transcript checker, but reword Appendix B accordingly and
  archive the interval-generation transcript/log with enough detail to make the
  certificate auditable.

### F2 - Truncated Final Bin Needs Its Own Demand Case

In the prime-rounding bridge, the proof handles later full source bins using the
bin-demand and bin-prime-supply estimates, then says the final truncated source
bin is handled the same way.  The stated bin-demand lemma applies to full
`[X,cX]` bins contained in a genuine block.  The final truncated bin may extend
past the block endpoint `B_h`, so the currently written proof leaves a small
uncited case.

Likely repairs:

- Add a truncated-bin corollary immediately after the bin-demand estimate.
- Or insert a short paragraph in the monotone-assignment proof bounding the
  truncated bin by the corresponding full bin and then applying the existing
  supply estimate.

The same local pass should also expose the dependence in the error term around
`sections/07-main-upper-bound.tex:1091-1094`; reviewers suggested writing the
small error as depending on the fixed bin ratio/queue parameters before
diagonalization, rather than only as `o_{H,\lambda}(1)`.

### F3 - Draft Status Is Stale

`DRAFT_STATUS.md` still lists old section filenames and an old paper structure,
and it reports a 35-page draft.  The current `main.tex` uses 9 main sections and
3 appendices, and the latest temp Tectonic build produced a 48-page PDF.

This is not a mathematical blocker, but it is release-hygiene risk if the paper
folder is archived or shared.  Refresh:

- section/file inventory,
- current page count,
- build command and final warnings,
- remaining human-authorship tasks,
- status of bibliography and artifact reproducibility.

## Verification Notes

The local compile check used:

```bash
tectonic -X compile --keep-logs --keep-intermediates --print --outdir /tmp/erdos-paper-compile main.tex
```

Result: successful 48-page PDF.  The final retained log had no unresolved
references or missing citations.  Remaining warnings were the XeTeX `inputenc`
warning and two underfull bibliography URL lines.

