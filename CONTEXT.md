# Project Context for AI Assistants

**Repository**: `plantilla-IV`
**Owner**: JJ (https://github.com/JJ/plantilla-IV)
**Description**: Repository for the "Infraestructura Virtual" class (ETSIIT-UGR). Contains Raku scripts, data, teaching material, exercises, and project templates. The main business logic is in the Github actions, all other modules are invoked from these Github Actions.

## Language & Runtime
- Primary language: **Raku** (Perl 6) – version 6.d as specified in `META6.json`.
- Requires a Raku installation (`rakudo`) and the dependencies listed in `META6.json`:
  - `IO::Glob`
  - `Text::CSV`
  - `Git::File::History`
  - `JSON::Fast`

## Project Structure
- `lib/` – Raku *and* JavaScript modules (`.rakumod`).
- `scripts/` – Helper scripts for analysis.
- `data/` – Datasets used in examples and exercises.
- `tests/` – Test suite (run with `prove -l t/`).
- `README.md` – High‑level overview and usage instructions.
- `META6.json` – Package metadata for Raku, dependencies, and provides mapping.
- `.github/workflows` – Core entry point for business logic, runs checks and analytics.
- `sesiones/` – Session notebooks and lecture material (non‑business logic).
- `proyectos/` – Template projects and assignment specifications (non‑business logic).
- `errores/` – Common pitfalls and error explanations (non‑business logic).

## Coding Standards
- Follow mainstream best practices for Raku, Perl, and any JavaScript code.
- Errors and warnings should be highly visible in GitHub Actions output.
- Use clear, descriptive naming and modular design.
- Keep scripts small, well‑documented, and idempotent.
- Tests must cover all public modules and scripts.

## Building / Running
```bash
# Install dependencies via the cpanfile (requires cpanminus)
cpanm --installdeps .
# Run a script, e.g.:
./scripts/analiza-datos.raku data/example.csv
```

## Testing
```bash
prove -l t/
```

## Important Links
- [Course website](http://jj.github.io/IV)
- [Methodology & Evaluation Criteria](Metodología_y_criterios_de_evaluación.md)
- [Session index](sesiones/README.md)
- [Project instructions](proyectos/README.md)
- [Common errors guide](errores/README.md)

---
This file provides a concise summary for AI code‑completion models (GitHub Copilot, Google Gemini, Anthropic Claude) to improve relevance of suggestions.
