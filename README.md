[![Built with Eidos](https://img.shields.io/badge/built%20with-Eidos-0f9d8c?labelColor=1a1a2e)](https://github.com/Montanalabs/eidos-lang)

> **Eidos** — the injection-safe language. Here prompt injection isn't *detected*, it's
> *unrepresentable*: untrusted input must cross `extract<ClosedType>` before it can reach an
> effect. `check` proves it at compile time; the compiled binary re-clamps at run time.

# Injection-safe batch under a cost `budget`

Beyond taint, this demonstrates the **Cost** axis via `budget` + per-effect `cost`.

- **Untrusted input:** `fetch<web>` — a stream of refund requests
- **Closed type:** `Decision = Small | Large | Deny`
- **Cost:** `grant refund cost 30` + `budget 100` — total static spend is bounded.
- **Consequence axes:** Trust · Cost (`budget`/`cost`)

The safe program runs a fixed plan of three refunds (3 × 30 = 90 ≤ 100). The `_unsafe`
variant runs the same three under a `budget 80` — the total (90) exceeds the cap, so the
checker rejects the over-spend. (A costed effect inside a loop is also rejected — the
checker only permits statically-bounded spend, so there is no runaway.)

## Run
```sh
examples/apps/budget-cap/demo.sh
```

---

<sub>Part of the <b><a href="https://github.com/Montanalabs/eidos-lang">Eidos</a></b> example corpus — 200 self-contained,
injection-safe projects. Built with Eidos, a language whose type system makes prompt injection
structurally impossible. Run <code>./demo.sh</code> with the Eidos toolchain on your PATH.</sub>
