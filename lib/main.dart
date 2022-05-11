import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:admin_web_movil/providers/auth_provider.dart';
import 'package:admin_web_movil/router/router.dart';
import 'package:admin_web_movil/services/local_storage.dart';
import 'package:admin_web_movil/services/navigation_service.dart';
import 'package:admin_web_movil/ui/layouts/auth/auth_layout.dart';
import 'package:admin_web_movil/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_web_movil/ui/layouts/splash/splash_layout.dart';

void main() async {
  await LocalStorage.configurePreferences();
  setUrlStrategy(PathUrlStrategy());
  Flurorouter.configureRoutes();
  runApp(const AppMultiprovider());
}

class AppMultiprovider extends StatelessWidget {
  const AppMultiprovider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);
        if (authProvider.authStatus == AuthStatus.checking) {
          return const SplashLayout();
        }
        if (authProvider.authStatus == AuthStatus.notAuthenticaded) {
          return AuthLayout(child: child!);
        } else {
          return DashboardLayout(child: child!);
        }

        // return AuthLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.5)))),
    );
  }
}
