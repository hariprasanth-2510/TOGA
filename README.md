# TOGA

Flutter application for the TOGA Learn module.

## Commit -1 — Configure app routing and theme

This commit introduces the application navigation shell and centralized
Material 3 theme configuration.

### Added
- GoRouter-based application routing
- Centralized light and dark themes
- Dedicated home screen
- `MaterialApp.router` application shell

### Current route

```text
/
└── HomeScreen
```

Feature-specific routes will be added as the learning and assessment
modules are implemented.

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

### Run

```bash
flutter pub get
flutter run
```

### Test

```bash
flutter test
```
