import 'dart:core';
import 'package:flutter/material.dart';
import 'package:fluttersigninusingfb/views/dashboard/dashboard.dart';
import 'package:fluttersigninusingfb/views/profile/profile.dart';
import './../../views/loginScreen/login_screen.dart';

class RoutePath {
  static const login = '/login';
  static const forgetPassword = '/forgetPassword';
  static const createAccount = '/createAccount';
  static const dashboard = '/dashboard';
  static const profile = '/login';
}

class Routes {
  static final routes = <String, WidgetBuilder>{
    RoutePath.login: (BuildContext context) => const LoginScreen(),
    RoutePath.dashboard: (BuildContext context) => const Dashboard(),
    // RoutePath.profile: (BuildContext context) => const Profile(
    //       email: '',
    //       name: '',
    //       profileImageLink: '',
    //     ),
  };
}
