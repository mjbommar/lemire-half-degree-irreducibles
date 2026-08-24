# Provenance

Everything under `research/`, `code/`, and `data/` was migrated out of the
[axeyum](https://github.com/mjbommar/axeyum) repository on 2026-08-23.

Axeyum is a general automated-reasoning stack. This material is the record of one
problem attacked with it -- Kaser--Lemire half-degree irreducibles over GF(2) --
and it is narrative, data, and problem-specific analysis rather than reusable
machinery. It was moved here so that axeyum keeps only the parts another problem
could use.

## Source commits

| Path | Source ref | Commit |
|---|---|---|
| `research/signed-trace/`, `code/signed-trace/`, 3 `F-gf2-lemire-*` facts | axeyum `main` (unpushed, 57 commits) | `6af5c55033c0038001bc3e88ab568832409beda1` |
| `research/gf2-cas/`, `research/decisions/`, `research/facts/`, `code/checkers/`, `data/` | axeyum `agent/gf2/lemire-proof` | `f3990c134255af9a57d1ba6a6930b0f2c0f3893f` |

Both are pinned in axeyum as `archive/lemire-signed-trace-20260823` and
`archive/gf2-lemire-proof-20260823`. Nothing here was deleted from axeyum before
being verified present here.

## What is here

- `research/signed-trace/` -- 22 numbered notes and a README: the signed-trace
  attack from statement of the problem through the weakening programme.
- `research/gf2-cas/` -- the CAS-side workstreams: the AC-bridge packet, the
  NoH-p2 packet, a ten-field blocker sweep, review notes, and
  `lemire-complete-proof.tex`.
- `research/decisions/` -- 109 ADRs recording the decisions taken during the
  attack. **These carry axeyum's numbering (0484-0592), which collides with
  numbers axeyum independently reused for unrelated decisions.** They are kept
  under their original filenames for traceability; the numbers are not
  authoritative outside this repo.
- `research/facts/` -- 45 fact-ledger entries, axeyum's
  `artifacts/ontology/fact.schema.json` format: formal statement, epistemic vs
  external status, evidence bindings.
- `code/signed-trace/` -- standalone Python (numpy, python-flint, sympy) plus
  four Rust examples kept as `.rs.txt`; they were never compiled into the crate.
- `code/checkers/` -- the problem-specific range and bound checkers.
- `data/` -- 408 JSON witness/shard artifacts, 28 MB, covering degrees 1-400.

## What stayed in axeyum

The reusable GF(2) machinery: bit-packed binary polynomial arithmetic, extension
field traces, sharded computation with SHA-256-bound canonical-JSON evidence,
independent certificate re-validation, and the foundational number theory
(Artin--Schreier, Witt vectors, Arf invariants, principal units, Kloosterman
bounds, additive energy). The Hayes attack machinery itself remains on the
long-lived axeyum branch `agent/gf2/lemire-proof`.
