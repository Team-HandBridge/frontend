import 'package:dalm/app/router/app_placeholder_page.dart';
import 'package:dalm/app/router/app_routes.dart';
import 'package:go_router/go_router.dart';

final authRootRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.splash,
    builder: (context, state) {
      return const AppPlaceholderPage(title: '스플래시');
    },
  ),
  GoRoute(
    path: AppRoutes.onboarding,
    builder: (context, state) {
      return const AppPlaceholderPage(title: '온보딩');
    },
  ),
  GoRoute(
    path: AppRoutes.login,
    builder: (context, state) {
      return const AppPlaceholderPage(title: '로그인');
    },
  ),
];
