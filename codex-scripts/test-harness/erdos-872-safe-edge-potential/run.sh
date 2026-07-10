#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

mkdir -p artifacts/data artifacts/repros
python3 verify_safe_edge_potentials.py \
  --seed "${SAFE_EDGE_SEED:-872}" \
  --random-cases "${SAFE_EDGE_RANDOM_CASES:-100000}" \
  --max-random-n "${SAFE_EDGE_MAX_RANDOM_N:-9}" \
  --max-weight "${SAFE_EDGE_MAX_WEIGHT:-4}" \
  --exhaustive-n "${SAFE_EDGE_EXHAUSTIVE_N:-4}" \
  --exhaustive-residual-n "${SAFE_EDGE_EXHAUSTIVE_RESIDUAL_N:-5}" \
  --artifact artifacts/data/latest.json \
  --repro artifacts/repros/latest-failure.json
