import 'package:dalm/features/home/presentation/routes/home_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [...homeRoutes],
  );

  ref.onDispose(router.dispose);

  return router;
});
