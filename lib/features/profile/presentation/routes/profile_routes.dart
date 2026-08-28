import 'package:dalm/app/router/app_placeholder_page.dart';
import 'package:dalm/app/router/app_routes.dart';
import 'package:go_router/go_router.dart';

abstract final class ProfileRouteLocations {
  static const detail = '${AppRoutes.profile}/detail';
}

final profileShellRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.profile,
    builder: (context, state) {
      return const AppPlaceholderPage(title: '마이페이지');
    },
  ),
];

final profileRootRoutes = <RouteBase>[
  GoRoute(
    path: ProfileRouteLocations.detail,
    builder: (context, state) {
      return const AppPlaceholderPage(title: '마이페이지 상세');
    },
  ),
];
