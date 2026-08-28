import 'package:dalm/app/router/app_placeholder_page.dart';
import 'package:dalm/app/router/app_routes.dart';
import 'package:go_router/go_router.dart';

final matchRootRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.matching,
    builder: (context, state) {
      return const AppPlaceholderPage(title: '매칭');
    },
  ),
];
