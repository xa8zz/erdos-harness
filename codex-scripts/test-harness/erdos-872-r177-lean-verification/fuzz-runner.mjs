#!/usr/bin/env node
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const args = parseArgs(process.argv.slice(2));
const harnessRoot = path.dirname(fileURLToPath(import.meta.url));
const cases = readInt(args.cases, 200);
const seed = readInt(args.seed, 0x5eed);
const corpusPath = path.resolve(harnessRoot, args.corpus || 'corpus/cases.json');
const corpus = JSON.parse(fs.readFileSync(corpusPath, 'utf8'));
const rng = mulberry32(seed);
let executed = 0;

for (const corpusCase of corpus.cases || []) {
  runCase(corpusCase, 'corpus:' + (corpusCase.name || executed));
}

for (let index = 0; index < cases; index++) {
  const generated = buildGeneratedCase(index, rng);
  if (generated === null) break;
  runCase(generated, 'generated:' + index);
}

console.log(JSON.stringify({
  name: 'erdos-872-r177-lean-verification-fuzz',
  seed,
  requestedCases: cases,
  executed,
  status: 'ok'
}, null, 2));

function runCase(testCase, id) {
  try {
    const actual = runSubject(testCase.input);
    assert.deepStrictEqual(actual, testCase.expected, 'case mismatch ' + id);
    executed++;
  } catch (error) {
    if (args.writeRepro) writeRepro(args.writeRepro, testCase, id, error);
    throw error;
  }
}

function runSubject(input) {
  // Replace with the production API or state transition under test.
  return input;
}

function buildGeneratedCase(index, rng) {
  // Generate valid inputs first, then mutate them along the target contract.
  void index;
  void rng;
  return null;
}

function writeRepro(outPath, testCase, id, error) {
  const resolved = path.resolve(harnessRoot, outPath);
  fs.mkdirSync(path.dirname(resolved), { recursive: true });
  fs.writeFileSync(resolved, JSON.stringify({
    id,
    error: error && error.stack ? error.stack : String(error),
    case: testCase
  }, null, 2) + '\n');
}

function mulberry32(seedValue) {
  let state = seedValue >>> 0;
  return function next() {
    state += 0x6D2B79F5;
    let value = state;
    value = Math.imul(value ^ (value >>> 15), value | 1);
    value ^= value + Math.imul(value ^ (value >>> 7), value | 61);
    return ((value ^ (value >>> 14)) >>> 0) / 4294967296;
  };
}

function parseArgs(argv) {
  const out = {};
  for (let index = 0; index < argv.length; index++) {
    const arg = argv[index];
    if (!arg.startsWith('--')) continue;
    const key = arg.slice(2);
    if (key === 'writeRepro' || key === 'write-repro') out.writeRepro = argv[++index];
    else out[key] = argv[++index] || true;
  }
  return out;
}

function readInt(value, fallback) {
  const number = Number(value);
  return Number.isFinite(number) && number >= 0 ? Math.floor(number) : fallback;
}
