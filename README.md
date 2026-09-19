# TOGA

Flutter application for the TOGA Learn module.

## Commit 03 — Configure application architecture

This commit establishes the feature-oriented application structure.

### Architecture

```text
Presentation
    ↓
Riverpod Providers
    ↓
Repositories
    ↓
Services / Data Sources
    ↓
Local Persistence
```

The project is organized by feature so that learning, assessment, progress,
and synchronization can evolve independently.

### Current structure

```text
lib/
├── app/
├── core/
├── database/
├── features/
│   ├── learning/
│   ├── assessment/
│   ├── progress/
│   └── sync/
└── main.dart
```

Persistence and concrete feature implementations are intentionally added in
later commits.

### Run

```bash
flutter pub get
flutter run
```

### Test

```bash
flutter test
```
