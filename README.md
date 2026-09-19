# TOGA

Flutter application for the TOGA Learn module.

## Commit 4 — Configure Isar local persistence

This commit introduces Isar as the local persistence layer selected for the
TOGA Learn assessment.

### Added

- `isar`
- `isar_flutter_libs`
- `build_runner`
- `isar_generator`
- Central `IsarDatabase` lifecycle service
- `LocalDatabaseService` abstraction for feature repositories

### Persistence direction

The application will keep learner state locally so that learning and
assessment recovery do not depend on network availability.

Planned persisted data includes:

- Learning session state
- Learning progress
- Notes
- Bookmarks
- Knowledge-check attempts
- Assessment attempts
- Assessment answers and flags
- Sync queue items

Collection models are intentionally introduced in the following commit so
that database setup and data modelling remain separate, reviewable changes.

### Generate Isar code

Once collection models are added:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run

```bash
flutter pub get
flutter run
```

### Test

```bash
flutter test
```
