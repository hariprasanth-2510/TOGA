# YC Paxel Builder Report — TOGA Learn

**Product:** TOGA by AIRMAN — Learn module
**Assessment:** Flutter Developer Internship Technical Assessment
**Author:** Repository contributor / candidate
**Report scope:** Repository evidence and verification completed on 20 September 2026.

## Executive summary

TOGA Learn is an offline-first Flutter learning module for Air Navigation → Radio Navigation. It combines a resumable seven-unit chapter with a configurable, recoverable practice assessment. Study progress, notes, bookmarks, knowledge-check answers, assessment answers, flags, current question, and the assessment deadline are stored locally and survive navigation and application restart.

The project meets the core mandatory learning-session and assessment requirements in the internship brief. One brief-level item remains partial: simulated sync is not yet a durable outbound queue with a visible Retry control. This gap is documented rather than overstated.

## Planning and scope decisions

The implementation follows the connected learning journey required by the brief:

```text
Air Navigation → Radio Navigation chapter → resumable learning unit
→ locally saved progress → practice assessment → topic analytics
→ weakest-topic revision unit
```

Work followed a risk-first order: typed models/seed data/database/repositories/providers; durable learning resume; assessment attempts/state guards/deadline timing; notes, bookmarks, checks, review, remediation and sync feedback; then validation. This prioritised persistence and recovery over visual polish.

## Architecture, state management, and tooling

The project uses a feature-oriented layered architecture. Business rules and persistence are not defined in widgets.

```text
Flutter presentation (screens and UI)
        ↓
Riverpod providers (dependency composition and async state)
        ↓
Feature services and repositories (rules, transitions, mapping)
        ↓
Drift + SQLite (seed content and learner-owned state)
```

Learning and assessment are separated into `data`, `domain`, and `presentation`. Typed models represent subjects, chapters, learning units, content blocks, checks, sessions, attempts, questions, and results. Notes/bookmarks are isolated from seed data, so content refreshes cannot overwrite learner data. Riverpod creates repositories/services and exposes typed async state; GoRouter owns parameterised unit, attempt, results, and review routes. An attempt is editable only while `inProgress`; submitted/evaluated attempts cannot silently become editable.

| Technology / software | Purpose |
| --- | --- |
| Flutter and Dart | Cross-platform app implementation. |
| Material 3 | Accessible UI controls and themes. |
| `flutter_riverpod` | State management and dependency injection. |
| `go_router` | Declarative parameterised navigation. |
| Drift and SQLite | Typed relational persistence, migrations, and transactions. |
| `path_provider` | SQLite location in the app documents directory. |
| `build_runner` and `drift_dev` | Typed database-code generation. |
| Flutter CLI / Dart formatter | Analysis, tests, formatting, and Android builds. |
| Git | Incremental source control and change review. |
| Codex | Requirement inspection, implementation support, debugging, and validation under developer review. |

## Implemented product behaviour

### Resumable learning session

- Seven seeded Radio Navigation units, exceeding the five-unit minimum.
- Persists subject, chapter, unit, scroll position, progress, completion, session start, study duration, and last activity.
- Continue Learning restores the last unit; saved scroll position is restored after layout.
- Three inline knowledge checks save answer, correctness, and timestamp, then show an explanation.
- Notes and bookmarks can be saved/edited and persist independently of seed content.
- UI exposes syncing, synced, pending, and failed-safe-on-device status feedback.

### Practice and assessment engine

- `AssessmentConfig` owns 20 questions, a 20-minute duration, 70% pass mark, review permission, question/option randomisation, and answer-visibility settings.
- Twenty questions cover VOR, DME, Interception, and Tracking. Each has ID, topic, subtopic, difficulty, four options, correct answer, explanation, marks, and linked learning-unit title.
- Attempts persist ID, status, timestamps, deadline, current question, question/option order, answers, and flags.
- Timer remaining time derives from persisted `deadlineAt`, not a decrementing UI value; it restores after restart and auto-submits at expiry.
- A `ValueNotifier` repaints the visual clock, avoiding database reads every second.
- Learners navigate freely, answer, flag, see state, and confirm submission with answered/unanswered/flagged totals.
- Results provide score, percentage, pass/fail, correct/incorrect/unanswered, time taken, topic accuracy, and weakest topic.
- Review shows learner answer, correct answer, correctness, explanation, topic, and difficulty.
- Weak-topic remediation resolves and opens the exact associated learning unit.

## Requirement verification against the internship brief

| Brief area | Status | Repository evidence |
| --- | --- | --- |
| Five or more units; structured content | Met | Seven seeded units and typed content blocks. |
| Session tracking and accurate resume | Met | `LearningSessions` stores required fields; unit screen restores scroll state. |
| Three persisted checks with result/explanation | Met | `KnowledgeChecks` and `KnowledgeCheckAttempts`; three seeded checks. |
| Persisted notes and bookmarks | Met | `UnitPersonalData` and note/bookmark UI. |
| Offline state and sync status | Partial | SQLite protects state and state is visible; durable queue/visible retry remain. |
| Configurable 20-question assessment over four topics | Met | `AssessmentConfig` and 20-question seed. |
| State machine, autosave, restart recovery | Met | Attempt/answer tables, service guards, persisted question/answers/flags/deadline. |
| Accurate timer and auto-submit | Met | Deadline calculation and expiry submission. |
| Navigator, flags, submit confirmation | Met | Assessment screen provides all three. |
| Results, analytics, review, remediation | Met | Result/review screens and direct weak-topic route. |
| Riverpod, GoRouter, typed models, repositories, local persistence | Met | Feature-oriented architecture above. |
| At least five meaningful tests | Met | Seven passing tests. |
| Required learning-progress-update test coverage | Met | In-memory SQLite repository test saves and restores learning progress/resume state. |
| README, report, runnable build, demo, Git history | Partial | README/report/history and local APK exist; final push/demo remain. |

## AI usage, steering, and manual debugging

AI was used as an engineering assistant, not as unchecked authority. Requirements were converted into explicit persistence/state rules; generated changes were reviewed against lifecycle, navigation, and migrations; then validation was run. The candidate retains responsibility for every submitted line and can explain the data flow/state transitions.

| Issue found | Manual correction / reasoning |
| --- | --- |
| Stale `SyncController.complete()` call caused `flutter analyze` to fail with `undefined_method`. | Replaced it with non-blocking `syncLocalChange()` using `unawaited`, matching the controller’s async API without delaying a debounced local save. |
| A decrementing timer would drift or reset after restart. | Persisted absolute `deadlineAt`; remaining time is calculated from wall-clock time. |
| Database/provider refresh every second causes unnecessary reads/rebuilds. | Kept visual timer state in `ValueNotifier`; only learner mutations persist/invalidate data. |
| Review nested under an active-attempt route could redirect away after submit. | Results/review use sibling submitted-attempt routes with explicit back destinations. |
| Default back navigation after route replacement could go somewhere unexpected. | Added deterministic `PopScope` and toolbar destinations. |
| Notes/bookmarks mixed into seed data risked loss on content updates. | Moved learner-owned data to an independent unit-keyed table. |
| Deprecated radio-group usage produced analysis warnings. | Migrated answer controls to `RadioGroup`. |

## Iteration evidence

Relevant meaningful commits:

```text
9b76932 feat: complete resumable learning and assessment experience
61b7dbf feat: add persistent learning sessions
0c8c1a7 feat: build learning experience UI
e86fe6e feat: add learning repository and providers
7c0d803 feat: seed Radio Navigation learning content
fd24764 refactor: migration to Drift
49980ff feat: add learning content data models
```

Later iterations added assessment persistence/recovery, notes/bookmarks/check attempts, route lifecycle fixes, reliable post-assessment navigation, timer efficiency improvements, theme support, and dashboard progress.

## Validation

Current workspace verification:

```bash
flutter analyze
flutter test
```

- `flutter analyze`: **No issues found**.
- `flutter test`: **7 tests passed**.
- A local release APK is present at `build/app/outputs/flutter-apk/app-release.apk`.

Tests cover scoring/percentage, correct/incorrect/unanswered accounting, topic mastery/weakest-topic calculation, deadline-based timer recovery, shuffled-option correctness, persisted learning-session progress/resume data, and app-shell startup.

## Known gaps and next steps

1. Implement a durable outbound sync queue with mutation IDs/idempotency keys, acknowledgement-based status, and an exposed Retry action.
2. Add device-level background/restart integration tests for learning and assessment recovery.
3. Assessment completion is stored, but aggregate learner analytics for assessment count, average score, and cross-attempt topic mastery are not yet implemented.
4. Replace text diagram placeholders with accessible aviation visual assets and captions.
5. Persist theme selection and configure a unique production Android ID/signing key before public distribution.

## Submission and demo checklist

- [x] Working Flutter source code
- [x] README with architecture, persistence, sync strategy, AI usage, trade-offs, and known issues
- [x] Seven automated tests (minimum five)
- [x] Local release APK present
- [x] YC Paxel Builder Report
- [ ] Implement durable sync queue and Retry UI if full sync compliance is required
- [ ] Push final working tree to GitHub
- [ ] Upload the release APK as a GitHub Release asset or requested attachment
- [ ] Record/upload the 3–5 minute demo video and add its share link to the README

Demo: (1) subject → unit → knowledge check → note/bookmark → relaunch/resume; (2) assessment → answer/flag → relaunch with restored timer → submit → analytics/review → exact weak-topic learning unit.
