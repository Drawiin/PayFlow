import 'package:flutter/cupertino.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/values/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  setUser(UserModel? user, BuildContext context) {
    if (user != null) {
      _user = user;
      saveUser(user);
      Navigator.pushReplacementNamed(context, AppRoutes.home, arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  Future<void> saveUser(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user", userModel.toJson());
  }

  Future<void> hasLoggedUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("user")) {
      final user = prefs.getString("user") as String;
      await Future.delayed(Duration(seconds: 1));
      setUser(UserModel.fromJson(user), context);
    } else {
      setUser(null, context);
    }
  }
}
