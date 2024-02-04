import 'package:flutter/cupertino.dart';

class RoutePage {
  static void move(
    BuildContext context,
    String pageName, {
    dynamic arguments,
    Function(dynamic value)? callback,
  }) {
    Navigator.of(context)
        .pushNamed(pageName, arguments: arguments)
        .then((value) {
      callback?.call(value);
    });
  }

  static void moveAndReplace(
    BuildContext context,
    String pageName, {
    dynamic arguments,
    Function(dynamic value)? callback,
  }) {
    Navigator.of(context)
        .pushReplacementNamed(pageName, arguments: arguments)
        .then((value) {
      callback?.call(value);
    });
  }

  static const login = '/login';
  static const sign = '/sign';
  static const home = '/home';
  static const personal = '/personal';
  static const widgetUpdate = '/widgetUpdate';
}
