import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A user-controlled appearance preference. The default follows the device;
/// an explicit selection applies immediately across every routed screen.
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
