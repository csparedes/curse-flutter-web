import 'package:admin_web_movil/providers/auth_provider.dart';
import 'package:admin_web_movil/ui/views/dashboard_view.dart';
import 'package:admin_web_movil/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticaded) {
      return const LoginView();
    } else {
      return const DashboardView();
    }
  });
}
