import 'package:admin_web_movil/router/admin_handlers.dart';
import 'package:admin_web_movil/router/dashboard_handlers.dart';
import 'package:admin_web_movil/router/no_page_found_handler.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.fadeIn);
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
