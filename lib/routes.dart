import 'package:flutter/material.dart';
import 'package:pokemon/home.dart';

const String kLoginRoute = '/login';
const String kRegisterRoute = '/register';
const String kResetPasswordRoute = '/resetPassword';
const String pathHome = '/';
const String kError = '/error';

Map<String, WidgetBuilder> router = {
  pathHome: (context) =>  home(),
};