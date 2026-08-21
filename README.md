# Half-degree irreducibles over GF(2): a proof roadmap

This repository contains a short mathematical note explaining the current
state of the Kaser--Lemire conjecture on irreducible binary polynomials whose
nonleading terms have degree at most half the total degree.

**[Read the compiled paper in GitHub's embedded PDF viewer](lemire-proof-roadmap.pdf).**

The note is deliberately **not presented as a proof**. It separates:

- proved algebraic and analytic reductions;
- independently checked finite evidence through degree 400; and
- the remaining high-Witt signed-cancellation estimate.

Build and enforce the five-page limit with:

```sh
make check
```

The resulting PDF is `build/main.pdf`. The source is in [`paper/main.tex`](paper/main.tex),
and the checked-in viewer copy is [`lemire-proof-roadmap.pdf`](lemire-proof-roadmap.pdf).

Paper content is licensed under [CC BY 4.0](LICENSE).
