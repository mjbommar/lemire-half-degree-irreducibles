# Half-degree irreducibles over GF(2)

Kaser and Lemire conjectured that for every degree `n` there is an irreducible
polynomial over `GF(2)` of the form `x^n + g` with `deg g <= n/2` — a shape
that makes Barrett reduction cheap in a string-hashing kernel. Lemire first
asked it on
[MathOverflow](https://mathoverflow.net/questions/81717) in November 2011; it
appears in Kaser and Lemire, *Strongly universal string hashing is fast*,
Comput. J. **57**(11) (2014), [arXiv:1202.4961](https://arxiv.org/abs/1202.4961).
The question is Legendre's conjecture for `F_2[t]`: does the interval of
length `sqrt(X)` around `x^n` always contain a prime? Over function fields the
Riemann hypothesis is a **theorem** (Weil) and is still not enough — it
delivers an irreducible whenever the remainder may have degree
`n/2 + log_2 n`, and the conjecture is exactly the removal of that logarithm.

These notes record the reduction, the finite evidence, and the obstruction —
not a proof. The conjecture reduces to one first-moment cancellation estimate
for the complete family of Witt-vector Dirichlet characters at **fixed** `q=2`
and growing conductor: a saving of a factor `~n` over the per-character Weil
bound. Unconditionally there are certified witnesses through degree 3000; all
but `< 4l^2 2^-l` of the `2^l` half-degree patterns are realized; monomial
substitution gives infinite in-window families from every seed (reaching 9.3%
of composite `n <= 10^5`, and never a prime `n`); the window has exact level
of distribution `|W_n|`, which yields an element with at most three
irreducible factors each of large degree; and the conjecture is a theorem over
`F_q` for large `q`. Four barriers are proved — moduli-only, symmetry,
construction, and parity — each ruling out a class of argument, and the
geometric route has been re-posed as a precise cohomological-degree question.

## What this means in practice

The conjecture came from a performance question — Barrett reduction in
`GF(2^L)` is cheaper when the reduction polynomial's non-leading terms are
low-degree — so it is worth stating plainly what the mathematics says to
someone choosing a field representation.

**The truth is far stronger than the conjecture, so practice never needed it.**
The conjecture permits junk up to degree `L/2`. Measured (independent search,
479 degrees to `L = 3000`), the *minimum* achievable is about `log_2 L`:

| `L` | 64 | 128 | 163 | 233 | 256 | 283 | 409 | 512 | 571 | 1024 | 2000 | 3000 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| minimal subdegree | 4 | **7** | 7 | 7 | 10 | 8 | 7 | 8 | 10 | 9 | 13 | 11 |
| conjecture allows | 32 | 64 | 81 | 116 | 128 | 141 | 204 | 256 | 285 | 512 | 1000 | 1500 |

AES-GCM's `x^128 + x^7 + x^2 + x + 1` has subdegree 7, which this table
confirms is optimal for `L = 128`. Standard choices already sit at the true
minimum, roughly two orders of magnitude better than the conjecture's promise.
**Proving Kaser--Lemire would not improve any deployed system.**

**The constraint that actually binds is Swan's theorem, not this conjecture.**
For `L = 0 mod 8` there is no irreducible *trinomial* at all, at any
subdegree — and that is exactly the set of sizes in use (64, 128, 256, 512,
1024, 2048). This is why GCM uses a pentanomial; it is forced, not chosen. If
you are free to pick `L` and want a trinomial, avoid multiples of 8.

**The infinite families here are the wrong tool for the job.** They produce
irreducibles of subdegree exactly `L/2` — the largest the conjecture permits,
i.e. the worst admissible case for reduction. They are mathematically the
point and practically the opposite of what you want.

**Searching is cheap anyway.** Irreducibles have density `1/L`, so a random
in-window candidate succeeds in `O(L)` tries and testing is fast; the
certified table through `L = 3000` covers every realistic size with an
explicit certificate. Finally, the reduction polynomial is a performance
choice only — all representations of `GF(2^L)` are isomorphic — so nothing
here bears on the security of anything.

## Documents

| | |
|---|---|
| **[The note](lemire-proof-roadmap.pdf)** (3 pp) | The reduction, the open estimate (HWO), the two sufficient statements, and what is provably blocked. Start here. |
| **[Barriers and attempts](lemire-barriers.pdf)** | The expansive record: what was tried, proofs of the barriers, the re-posed geometric question, and what might still work. |
| **[Almost all patterns](lemire-almost-all.pdf)** (4 pp) | An unconditional theorem: almost every half-degree pattern is realized by an irreducible. |

Sources are in [`paper/`](paper/). Build and enforce the page limits with:

```sh
make check         # the note, <= 3 pages
make check-note    # the almost-all companion, <= 4 pages
make check-barriers
```

Machine-checked evidence, the research ledger, and replayable diagnostics live
in [github.com/mjbommar/axeyum](https://github.com/mjbommar/axeyum) under
`docs/research/10-cas/lemire-signed-trace/` and
`scripts/lemire-signed-trace/`.

Paper content is licensed under [CC BY 4.0](LICENSE).
