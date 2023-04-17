import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../scanning_test_screen.dart';
part 'go_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(debugLogDiagnostics: true, routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ScanningTextTest(),
    ),
  ]);
}
