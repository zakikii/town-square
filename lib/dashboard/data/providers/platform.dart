import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider that determines if the current platform is web and meets the minimum width requirement.
/// Used for responsive layout decisions throughout the app.
final isWebPlatformProvider =
    Provider.family<bool, BuildContext>((ref, context) {
  return kIsWeb && MediaQuery.of(context).size.width > 600;
});
