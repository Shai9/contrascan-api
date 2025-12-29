## Architecture Overview

ContraScan is built as a deterministic analysis pipeline:

1. File ingestion (ActiveStorage)
2. Text extraction (PDF/DOCX aware)
3. Clause parsing (structure-preserving)
4. Rule-based risk detection
5. Evidence-backed risk reporting (JSON API)

AI augmentation is intentionally layered on top of a rules first core to ensure explainability and legal defensibility.

## Why Rules First?

Most contract analysis tools rely entirely on LLMs, which introduces:
- hallucinations
- lack of explainability
- weak legal defensibility

ContraScan uses AI only as an augmentation layer.
All detected risks are backed by:
- explicit clauses
- known risk patterns
- deterministic matching
