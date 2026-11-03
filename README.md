# swift-distribution

Use this package when you need to name, pass around or persist a choice of how items share the space of a run: fill it, or leave gaps between, around or evenly. It is vocabulary only; it computes no positions or sizes, so the layout code that consumes the choice owns the arithmetic. Start from `Distribution`; the gap choices on their own are `Distribution.Space`.

## Laws

- `Distribution.allCases` lists `.fill`, then `.space(.between)`, `.space(.around)` and `.space(.evenly)`, in that order, each exactly once.
- The encoded form is the compiler-synthesized enum shape and is part of the persisted contract: `.fill` is `{"fill":{}}`, and a gap choice is `{"space":{"_0":<space>}}`, where `<space>` is exactly how that `Distribution.Space` encodes on its own (`{"between":{}}`, `{"around":{}}`, `{"evenly":{}}`).
- Decoding fails when the choice is absent, unknown, or when more than one choice is present, at either level.
