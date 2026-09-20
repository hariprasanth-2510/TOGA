# TOGA Learn

Offline-first Flutter module for Air Navigation → Radio Navigation. You study a seven-unit chapter, take a timed practice test on it, and get sent back to the exact unit you're weakest on. Closing the app at any point doesn't lose anything.

**Demo video, report and APK:** https://drive.google.com/drive/folders/1V_PDd6sBsRAyQXU3KAIbd_FvrC8lqf0N?usp=sharing

## Setup

You need Flutter (stable) and an Android device or emulator.

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

The `build_runner` step generates the Drift database code, so the app won't compile without it. Re-run it if you touch any table definition.

Checks:

```bash
flutter analyze
flutter test
```

Release APK:

```bash
flutter build apk --release
# build/app/outputs/flutter-apk/app-release.apk
```

## What it does

**Learning session**
- Seven units of Radio Navigation content, loaded from seed data (nothing is hard-coded in widgets).
- Three units have an inline knowledge check. You pick an answer, see if it's right, read the explanation, and the attempt is saved.
- Every unit can be bookmarked and has an editable note.
- The app stores the current unit, scroll position, read progress, completion, study time and last activity. The "Continue Learning" card takes you straight back to where you stopped, scroll position included.

**Practice assessment**
- 20 questions, 20 minutes, 70% pass mark, across VOR, DME, Interception and Tracking. All of that comes from an `AssessmentConfig` object rather than the UI.
- Question order and option order are randomised once and saved, so a restored attempt looks identical.
- Question navigator (answered / unanswered / current / flagged), flagging, and a confirmation dialog showing answered, unanswered and flagged counts before you submit.
- Results show score, percentage, pass/fail, correct/incorrect/unanswered, time taken, per-topic accuracy and the weakest topic.
- Review screen shows your answer, the correct one, the explanation, topic and difficulty.
- "Review weak topic" opens the learning unit linked to that topic, not the top of the chapter.
- The dashboard shows assessments completed, average score and topic mastery across all submitted attempts.

## Architecture

Feature-first folders. Learning and assessment each have their own `data`, `domain` and `presentation` layers.

```text
screens / widgets
      ↓  (Riverpod providers)
services
      ↓
repositories
      ↓
Drift + SQLite
```

Rules like scoring, mastery, state transitions and the timer live in the services, not in widgets. Repositories are the only place Drift's generated row types get turned into the app's own models, so swapping the data source for an API later shouldn't touch anything above them. Routing is GoRouter, with parameterised routes for units, attempts, results and review.

## State management

Riverpod does two jobs here: building repositories/services once, and exposing async state to screens. I used it over passing things around manually mainly because overriding a provider with an in-memory database in tests is trivial.

One deliberate exception: the countdown clock is a `ValueNotifier`, not a provider. Watching a provider that reads the database every second was causing pointless rebuilds. Only real user actions (answering, flagging, moving between questions) write to the database.

## Persistence

I went with Drift on SQLite. An attempt is relational (attempt → questions → answers and flags) and needs to be updated in one go, so I wanted real transactions instead of a pile of key-value entries. It also makes the analytics queries easy.

Stored locally:

- seed content (subject, chapter, units, checks, questions)
- learning sessions
- notes and bookmarks, in their own table keyed by unit, so updating seed content can never wipe them
- knowledge check attempts
- assessment attempts and their answers
- the sync outbox

An attempt can only be edited while it's `inProgress`. Once it's submitted the service layer refuses further changes, so a finished attempt can't quietly become editable again.

**Timer:** the attempt stores an absolute `deadlineAt`. Time remaining is always `deadlineAt − now`, so leaving the app, killing it, or reopening it hours later gives the right answer. When time runs out the attempt auto-submits.

## Sync strategy

Every change is written to SQLite first. The sync status shown in the UI (`Syncing`, `Synced`, `Pending`, `Sync failed`) only changes after that write, so studying offline is always safe.

Changes are queued in a local outbox, and pending changes for the same record are collapsed into one so retrying doesn't create duplicates. If a sync fails, the UI says the progress is saved on the device and offers Retry.

There's no backend in this project, so the upload step is simulated behind `SyncService` / `SyncRepository`. To connect a real API you'd:

1. attach an idempotency key to each queued mutation,
2. upload pending records in batches,
3. mark a record `synced` only after the server acknowledges it,
4. leave failed ones pending and retry with backoff.

## Tests

Nine tests. They cover:

- scoring, plus correct / incorrect / unanswered counts
- topic mastery and weakest-topic selection
- timer recovery from a persisted deadline
- correct answer tracking with shuffled options
- learning progress saved and restored (in-memory SQLite)
- sync queue de-duplication
- analytics across multiple attempts
- app startup

I tried to test the things that would hurt most if they broke: the score, the topic you're sent to revise, the time left, and where you resume.

## AI usage

I used Codex for reading through the requirements, speeding up implementation, and running analysis and tests. I reviewed what it produced against app lifecycle behaviour, Drift migrations and how the timer behaves after a restart.

Things it got wrong, or that I changed:

- **Timer:** the first approach was a decrementing counter, which drifts and resets after a restart. Replaced it with the persisted `deadlineAt`.
- **Async saves:** saves weren't guarded, so a failure inside a timer callback could surface as an unhandled error. Wrapped them.
- **Sync call:** a stale `SyncController.complete()` call broke `flutter analyze` (`undefined_method`). I replaced it with a non-blocking `syncLocalChange()` via `unawaited` so a debounced save isn't held up.
- **Navigation:** review nested under the active-attempt route could redirect away after submitting. Results and review now sit on sibling routes with explicit back destinations and a `PopScope`.
- **Notes and bookmarks:** they were initially mixed into seed data. Moved to their own table.
- **Radio buttons:** switched to `RadioGroup` after the deprecation warnings.

## Trade-offs (48 hours)

1. **Simulated sync.** The queue, statuses and retry are real, but there's no authenticated backend, since I had no server contract to code against.
2. **Knowledge checks keep the latest answer only.** Full answer history and richer analytics would come next.
3. **Diagrams are text placeholders.** I put time into persistence and recovery first. Real content should ship accessible images with captions.
4. **No device-level lifecycle tests.** In-memory database tests were quicker to write and cover the rules, but they don't exercise a real background/restart cycle.

## Known issues

- Restart and background recovery has not been covered by automated device tests.
- The Android application ID and signing key are still defaults. Set both before publishing anywhere public.
- Theme choice isn't saved between launches.
- Sync isn't connected to a real server yet, so nothing syncs across devices.

## Future improvements

- Integration tests for restart and background events on a physical device
- Accessible aviation diagrams
- Real backend sync using the idempotency approach above
- Knowledge check history
- Persist the theme setting
