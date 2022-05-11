import 'package:admin_web_movil/router/router.dart';
import 'package:admin_web_movil/services/local_storage.dart';
import 'package:admin_web_movil/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticaded();
  }

  login(String email, String password) {
    _token = 'Imagina que esto es un JWT';
    LocalStorage.preferences.setString('jwt', _token!);
    authStatus = AuthStatus.authenticaded;
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
    notifyListeners();
  }

  Future<bool> isAuthenticaded() async {
    if (LocalStorage.preferences.getString('jwt') == null) {
      authStatus = AuthStatus.notAuthenticaded;
      notifyListeners();
      return false;
    }
    await Future.delayed(const Duration(seconds: 1));
    authStatus = AuthStatus.authenticaded;

    notifyListeners();
    return true;
  }
}

enum AuthStatus { checking, authenticaded, notAuthenticaded }
