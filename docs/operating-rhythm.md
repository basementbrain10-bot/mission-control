# Agent Operating Rhythm

## Daily Cadence

| Block | Timebox | Activities |
|---|---:|---|
| Triage | 15 min | Review new issues, comments, alerts; label + prioritize |
| Plan | 10 min | Pick top outcomes; define next actions; set timeboxes |
| Execute | 60–180 min | Focus sprint(s) on P0/P1 items; ship incremental PRs |
| Closeout | 5–10 min | Update issue/PR status; log outcomes; set tomorrow’s top 3 |

## Weekly Cadence

- **Weekly planning (30 min):** backlog grooming, priorities for the week, select top outcomes
- **Maintenance window (30–60 min):** dependency updates, cleanup, reliability work
- **Weekly retro (15 min):** what worked, what broke, what to change next week

## Triage Rubric

### Severity (S0–S3) — impact level (lower is more urgent)

| Severity | Definition |
|---|---|
| S0 | Outage / data loss / security incident |
| S1 | Major feature broken or high-risk vuln |
| S2 | Non-critical bug / degraded UX |
| S3 | Enhancement / docs / nice-to-have |

### Priority (P0–P3) — when to act (lower is more urgent)

| Priority | Definition |
|---|---|
| P0 | Today |
| P1 | Within 48 hours |
| P2 | This week |
| P3 | Backlog |

### Scoring (Unambiguous)

Lower numbers are more urgent (S0/P0 highest urgency). Use:

`UrgencyScore = (2 × Severity) + (1 × Priority)` where **lower = more urgent**.

Work items in ascending order (lowest score first). Break ties by user impact and deadlines.

## Definition of Done (DoD)

A task/issue is **Done** when:

- Acceptance criteria are satisfied (or explicitly N/A with rationale).
- Scope is tight (no incidental refactors).
- Tests/checks pass, or PR states why they are N/A (docs-only, etc.).
- Docs updated if behavior/interfaces changed.
- No secrets/config changes (`.env*`, tokens, auth profiles).
- PR includes:
  - Summary of changes
  - Test plan
  - Issue linkage (e.g., `Closes #2`)
- Working tree is clean (no stray local artifacts).

## Templates

### Daily Log (5 minutes)

- Date:
- Triage (new issues/alerts):
- Today’s Top 3 (timeboxed):
  1.
  2.
  3.
- Executed (what shipped):
- Blockers / Risks:
- Notes:
- Tomorrow plan:

### Weekly Review (15–20 minutes)

- Week of:
- Wins (shipped outcomes):
- Misses / Incidents (what broke, what we learned):
- Backlog Health:
  - Open issues:
  - Oldest issue age:
  - P0/P1 count:
- Quality / Reliability:
  - Bugs closed:
  - Regressions:
- Next Week Focus (Top 3 outcomes):
  1.
  2.
  3.
- Maintenance Tasks (deps, cleanup, debt):## Definition of Done (DoD)

A task/issue is **Done** when:

- The acceptance criteria are satisfied (or explicitly marked N/A with rationale).
- The change is minimal and scoped (no incidental refactors).
- Tests/checks pass, or the PR notes why they are N/A (docs-only, etc.).
- Docs are updated if behavior or interfaces changed.
- No secrets/config were added or modified (`.env*`, tokens, auth profiles).
- PR includes:
  - Summary of changes
  - Test plan
  - Link/closure reference (e.g., `Closes #2`)
- Working tree is clean (no stray files), and `.gitignore` covers common local artifacts.

## Scoring (Unambiguous)

Severity (S0–S3) and Priority (P0–P3) are ordered such that **lower is more urgent** (S0/P0 are highest urgency).

Use a **Weighted Urgency Score** where **lower = more urgent**:

`UrgencyScore = (2 × Severity) + (1 × Priority)`

Work items in ascending order (lowest score first). Break ties by user impact and deadline.

## Templates

### Daily Log (5 minutes)

- Date:
- Triage (new issues/alerts):
- Today’s Top 3 (timeboxed):
  1.
  2.
  3.
- Executed (what shipped):
- Blockers / Risks:
- Notes:
- Tomorrow plan:

### Weekly Review (15–20 minutes)

- Week of:
- Wins (shipped outcomes):
- Misses / Incidents (what broke, what we learned):
- Backlog Health:
  - Open issues:
  - Oldest issue age:
  - P0/P1 count:
- Quality / Reliability:
  - Bugs closed:
  - Regressions:
- Next Week Focus (Top 3 outcomes):
  1.
  2.
  3.
- Maintenance Tasks (deps, cleanup, debt):
