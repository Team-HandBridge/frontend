import 'package:dalm/app/router/app_placeholder_page.dart';
import 'package:dalm/app/router/app_routes.dart';
import 'package:go_router/go_router.dart';

final momentRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.moments,
    builder: (context, state) {
      return const AppPlaceholderPage(title: '순간들');
    },
  ),
];
