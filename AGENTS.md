# AGENTS.md — Instructions for AI Coding Assistants

> **Domain & Architecture Context:** Refer to `@CONTEXT.md` for project structure, runtime dependencies, and non-business-logic directories.

## Core Rules & Persona
* **Primary Language:** Raku (v6.d). Do not substitute with standard Perl or Raku-incompatible syntax.
* **Primary Trigger Points:** The core logic is orchestrated via GitHub Actions workflows (`.github/workflows/`). Treat workflow constraints and actions as the main execution path.

---

## Code Style & Raku Conventions

* **Imports:** Only use dependencies declared in `META6.json` (`IO::Glob`, `Text::CSV`, `Git::File::History`, `JSON::Fast`). Do not add external dependencies without explicit user request.
* **Testing:** Write tests compatible with standard `App::Prove` (`prove -l t/`). Ensure tests reside in `t/` or `tests/`.
* **Deprecation Avoidance:** Maintain strictly modern Raku idiom and formatting.

---

## Coding Standards (from Copilot instructions)

* Follow mainstream best practices for Raku, Perl, and any JavaScript code.
* Errors and warnings should be highly visible in GitHub Actions output.
* Use clear, descriptive naming and modular design.
* Keep scripts small, well‑documented, and idempotent.
* Tests must cover all public modules and scripts.

---

## Objetivos/Entregas Domain Model (learned the hard way, 2026-08-13)

`IV::Stats::Utils::estado-objetivos()` parses `proyectos/objetivo-N.md` (or the
fixture equivalent under `t/fixtures/proyectos/`) row by row. Before touching
`IV::Stats`, `IV::Stats::Fechas`, or their tests, know this:

* Each table row is one submission **attempt** for one student, matched via a
  `github.com/<user>/...` URL. Rows without a `github` substring (e.g. an
  unfilled template row like `| <!-- Enlace de NOMBRE --> | | |`) are skipped
  entirely — no state, no version, not counted anywhere.
* A student's state is **CUMPLIDO** (✓), **INCOMPLETO** (✗), or **ENVIADO**
  (has a link, no mark) — mutually exclusive per student per objetivo. If a
  student has multiple rows (resubmissions), only the *last* matching row's
  state wins, since the hash entry is overwritten each iteration.
* `@!objetivos[$n]` (→ `cumple-objetivo`) and `@!entregas[$n]` (→
  `hecha-entrega`) are populated on an exclusive `if/elsif` — a student is in
  at most one of them per objetivo. **This is intentional, not a bug.** Do not
  "fix" a failing test by making the library add CUMPLIDO students to
  `@entregas` too — that breaks the state model. If a test's assertion
  implicitly assumes a student can be both, the assertion (or the fixture
  data) is what's wrong, not the library.
* A version string (`vX.Y.Z`) can appear on a row in *any* state — CUMPLIDO
  rows carry a version too. So raw version-line counts from file content are
  **not** directly `==`-comparable against `hecha-entrega($o).elems` alone;
  combine `hecha-entrega($o) ∪ cumple-objetivo($o)` (Set union), and even then
  expect `>=` rather than `==`, since resubmissions can add extra
  version-bearing lines beyond the deduplicated per-student Set size.
* Fixture files under `t/fixtures/proyectos/` need **real git history**
  (multiple commits showing an ENVIADO row, then a later CUMPLIDO row) for
  `Git::File::History`-based code (`IV::Stats::Fechas`) to see a transition.
  A single-commit fixture snapshot yields `Any` from `entregas-de()`.
* Every test that constructs `IV::Stats`/`IV::Stats::Fechas` and reads
  `PROYECTOS`-relative paths needs the fixture-redirect guard used in
  `t/00-basic.rakutest`:
  ```raku
  BEGIN {
      unless "proyectos/usuarios.md".IO.s > 100 {
          %*ENV<IV_PROYECTOS> = "t/fixtures/proyectos/";
      }
  }
  ```
  It's easy to add a new fixture/test and forget to wire this in — check for
  it explicitly when a test crashes reading `proyectos/` in an environment
  that shouldn't have real production data.

**Process rule:** when a test fails, the default hypothesis is that the test
or fixture is wrong, not that the library is wrong — especially when the
library encodes an explicit, intentional invariant (like the mutually
exclusive states above). Do not change production code to make a test pass
without first confirming, from the domain model, that the code's invariant is
actually broken.

---

## Perl side (`src/`, `lib/IV/*.pm`, `t/*.t`)

A handful of GitHub Actions entry points are plain Perl, not Raku:

* Dependencies for this Perl code are declared in `cpanfile` at the repo
  root, **not** in `META6.json` (that file is Raku-only) and not in
  `package.json`/`node_modules` (there are no Node deps here). Assume
  whatever is listed in `cpanfile` is installed — do not spend a step
  verifying `perl -M...` or `which <tool>` before using it.
* `src/*.pl` are the editable sources. They are never run directly in CI —
  `make versiones` / `make revisores` (see `Makefile`) run `fatpack pack`
  on them to produce single self-contained files under `scripts/`
  (`scripts/check-version`, `scripts/random-reviewer`), which is what the
  GitHub Actions workflows actually invoke. `fatlib/` holds the pre-built
  CPAN dependency tree used by that packing step.
* Shared/testable logic for these scripts lives in `lib/IV/*.pm`
  (`IV::CheckVersion`, `IV::RandomReviewer`), pulled in via
  `use FindBin; use lib "$FindBin::Bin/../lib";` so it resolves correctly
  both when run standalone and when traced by `fatpack pack`.
* Tests for this code are plain `Test::More` scripts under `t/*.t`, run via
  `prove -l t/` — as opposed to the Raku suite's `t/*.rakutest` files in
  the same directory.

---

## References & Documentation Policy

* **Reference Verification:** Always verify any bibliographical or external references provided in responses or documentation edits.
* **BibTeX Links:** Prefer linking directly to sources that include a `.bib` file or automated BibTeX generation whenever referencing academic or technical papers.

---

## Tool-Specific Stubs

If using tools with custom file expectations, point them to this file and `CONTEXT.md`:

* **Claude Code (`CLAUDE.md`):**
  ```markdown
  @/home/jmerelo/txt/docencia/asignaturas/infraestructura-virtual/plantilla-IV/CONTEXT.md
  @/home/jmerelo/txt/docencia/asignaturas/infraestructura-virtual/plantilla-IV/AGENTS.md
  ```
