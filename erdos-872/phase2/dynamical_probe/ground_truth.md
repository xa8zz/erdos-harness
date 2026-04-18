# Small-n Ground Truth

The optional exact-minimax comparison was not completed in this run.

The main dynamical probe sweep finished and wrote:

- `results.csv`
- `results_summary.csv`
- `ANALYSIS.md`

After the sweep, the Phase 1 exact solver was invoked for the optional
`n in {20, 30, 40, 50}` comparison, but it did not finish quickly enough to
justify delaying the main deliverables further. Re-run
`run_all.py --mode practical` after tightening the exact-solver wrapper if the
ground-truth comparison becomes important.
