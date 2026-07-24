#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

repo_root="$(git rev-parse --show-toplevel)"
lean_root="$repo_root/erdos-872/lean/r177_verification"
artifact_root="$PWD/artifacts"
log_root="$artifact_root/logs"
data_root="$artifact_root/data"

mkdir -p "$log_root" "$data_root"

build_log="$log_root/lake-build.log"
axiom_log="$log_root/print-axioms.log"
hole_log="$log_root/proof-holes.log"
result_json="$data_root/latest.json"

build_status=0
(
  cd "$lean_root"
  lake build
) >"$build_log" 2>&1 || build_status=$?

if rg -n '\b(sorry|admit)\b' "$lean_root" --glob '*.lean' >"$hole_log"; then
  hole_count="$(wc -l <"$hole_log" | tr -d ' ')"
else
  : >"$hole_log"
  hole_count=0
fi

axiom_status=0
(
  cd "$lean_root"
  lake env lean Erdos872R177/AxiomReport.lean
) >"$axiom_log" 2>&1 || axiom_status=$?

main_status=0
if ! rg -q "^'Erdos872\.main' depends on axioms:" "$axiom_log"; then
  main_status=1
fi

verdict="accepted"
if [ "$build_status" -ne 0 ] || [ "$axiom_status" -ne 0 ] || \
   [ "$main_status" -ne 0 ] || [ "$hole_count" -ne 0 ]; then
  verdict="rejected"
fi

printf '{\n  "verdict": "%s",\n  "build_status": %s,\n  "axiom_status": %s,\n  "main_status": %s,\n  "proof_hole_count": %s,\n  "build_log": "%s",\n  "axiom_log": "%s",\n  "proof_hole_log": "%s"\n}\n' \
  "$verdict" "$build_status" "$axiom_status" "$main_status" "$hole_count" \
  "$build_log" "$axiom_log" "$hole_log" >"$result_json"

printf 'verdict=%s build_status=%s axiom_status=%s main_status=%s proof_hole_count=%s\n' \
  "$verdict" "$build_status" "$axiom_status" "$main_status" "$hole_count"

if [ "$verdict" != "accepted" ]; then
  exit 1
fi
