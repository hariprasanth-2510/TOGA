# TOGA Learn

An offline-first Flutter learning experience for Radio Navigation. It combines a resumable chapter session with a timed, recoverable practice assessment and targeted revision.

## Run

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Build the release APK with `flutter build apk --release`. The generated file is `build/app/outputs/flutter-apk/app-release.apk`.

Run checks with `flutter analyze` and `flutter test`.

## What is included

- Seven structured learning units, with three answerable inline knowledge checks.
- Persisted current unit, scroll position, read progress, study time, completion, notes, bookmarks, and check answers.
- Resume card that takes the learner straight back to their last active position.
- A configurable 20-question / 20-minute assessment across VOR, DME, interception, and tracking.
- Persisted question order, option order, answers, flags, current question, deadline, and attempt state. The timer derives from the saved deadline, so backgrounding or restarting cannot reset it.
- Submission confirmation, scoring, pass/fail, topic accuracy, review explanations, and direct weak-topic remediation to the matching learning unit.
- Local save feedback (`Syncing`, `Synced`, `Sync failed — saved on this device`) and guarded async persistence so save failures do not crash a session.

## Architecture

```text
Presentation (screens/widgets)
        ↓ Riverpod providers
Feature services
        ↓ repositories
Drift / SQLite local database
```

The project is feature-oriented. Seed content, typed models, repositories, services, providers, and presentation remain separate. Widgets do not define chapter or question data. Drift is used for durable relational learner state; its generated database types are mapped to feature models at repository boundaries.

## State and persistence

Riverpod owns dependency construction and asynchronous screen state. SQLite stores seeded content, sessions, personal unit data, knowledge-check attempts, assessment attempts, and assessment answers. An assessment attempt is only editable in `inProgress`; it becomes immutable once submitted. The persisted deadline, rather than a decrementing counter, is the timer source of truth.

## Sync strategy

Local SQLite is always written before a sync status changes, so offline study is safe. The `SyncService`/`SyncRepository` boundary is intentionally API-ready: a production implementation should enqueue an idempotency key with each local mutation, upload pending records, and mark a record `synced` only after acknowledgement. The current app has no remote endpoint, so status feedback models the local-first acknowledgement path; a failed local save is clearly surfaced while the prior persisted state remains intact.

## Tests

The suite has nine automated tests covering scoring, unanswered/incorrect accounting, topic mastery and weak-topic selection, deadline-based timer recovery, randomized-option correctness, persisted learning-session progress/resume state, sync-queue de-duplication, cross-attempt analytics, and app startup.

## Submission assets

- **Release APK:** Upload `build/app/outputs/flutter-apk/app-release.apk` as a GitHub Release asset (recommended) or attach it wherever AIRMAN requests. Do not commit the generated `build/` directory.
- **Demo video:** Upload a 3–5 minute video to YouTube as **Unlisted** or Google Drive with viewer access, then add its share link below. Keeping the video outside the Git repository avoids a large, slow clone.

Demo video link: _Add your unlisted/share link here before submission._

### Submission checklist

- [x] Working Flutter source code
- [x] README and YC Paxel Builder Report
- [x] Seven automated tests
- [x] Release APK generated locally
- [ ] Push final commit to GitHub
- [ ] Upload APK as a GitHub Release asset / requested submission attachment
- [ ] Upload the demo video and replace the link above

## AI usage and engineering ownership

Codex was used to inspect requirements, accelerate implementation, and run static analysis/tests. Generated suggestions were reviewed against app lifecycle rules, Drift migrations, and persisted timer semantics. In particular, a naive decrementing timer and unguarded async saves were rejected because they would fail after a restart or let timer callbacks surface errors.

## 48-hour trade-offs / future work

1. Sync is API-ready and status-aware, but a real authenticated backend and durable outbound queue need a server contract.
2. Knowledge checks retain the latest answer; full answer history and richer learner analytics are future work.
3. Learning diagrams are represented by structured text placeholders; production content should ship accessible images or vector diagrams.
4. Add integration tests covering device restart and background lifecycle events on a physical device.

## Known issues

No known release-blocking application issues remain after static analysis and automated test validation. Before public-store distribution, configure a unique Android application ID and production signing key. The API-ready sync boundary also needs a real backend and durable outbound queue before it can synchronise across devices.
