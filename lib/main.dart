import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kDebugMode) {
      debugPrintStack(
          stackTrace: details.stack, label: details.exceptionAsString());
    }
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('Unhandled asynchronous error: $error');
      debugPrintStack(stackTrace: stackTrace);
    }
    return true;
  };
  runApp(
    ProviderScope(
      child: TogaApp(),
    ),
  );
}
