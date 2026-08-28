import 'package:dalm/features/home/presentation/routes/home_routes.dart';
import 'package:dalm/features/moment/presentation/routes/moment_routes.dart';
import 'package:dalm/features/postcard/presentation/routes/postcard_routes.dart';
import 'package:dalm/features/profile/presentation/routes/profile_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      ...homeRoutes,
      ...momentRoutes,
      ...postcardShellRoutes,
      ...postcardRootRoutes,
      ...profileShellRoutes,
      ...profileRootRoutes,
    ],
  );

  ref.onDispose(router.dispose);

  return router;
});
