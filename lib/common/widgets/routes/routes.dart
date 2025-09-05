import 'package:big_app/common/widgets/constants/routesConst.dart';
import 'package:big_app/initial/initial.dart';
import 'package:go_router/go_router.dart';
import 'package:big_app/login/login_logic.dart';
import 'package:big_app/dashboard/dashboard.dart';

class Routes {
  static final router = GoRouter(
  initialLocation: RoutesConst.initial,
  routes: [
    GoRoute(
      path: RoutesConst.initial,
      builder: (context, state) => const InitialPage(),
    ),
    GoRoute(
      path: RoutesConst.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutesConst.home,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutesConst.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);

}