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
