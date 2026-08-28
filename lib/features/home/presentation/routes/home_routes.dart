import 'package:dalm/app/router/app_placeholder_page.dart';
import 'package:dalm/app/router/app_routes.dart';
import 'package:go_router/go_router.dart';

final homeShellRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.home,
    builder: (context, state) {
      return const AppPlaceholderPage(title: '홈');
    },
  ),
];
