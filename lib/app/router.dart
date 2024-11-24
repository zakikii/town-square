import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'routes.dart';
import '../dashboard/presentation/pages/home_page.dart';
import '../dashboard/presentation/pages/web_home_page.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: !kReleaseMode,
      routes: [
        GoRoute(
          path: '/',
          name: Routes.home.name,
          builder: (context, state) =>
              kIsWeb ? const WebHomePage() : const HomePage(),
        )
      ]);
}
