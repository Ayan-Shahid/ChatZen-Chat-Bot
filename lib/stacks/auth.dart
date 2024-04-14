import 'package:chatzen/keys/navigator_keys.dart';
import 'package:chatzen/screens/get_started.dart';
import 'package:chatzen/screens/login.dart';
import 'package:chatzen/screens/register.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      '/': (context) => const GetStarted(),
      "/register": (context) => const Register(),
      '/login': (context) => const Login(),
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);

    return Navigator(
      initialRoute: '/',
      key: NavigatorKeys.authStackNavigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => routeBuilders[settings.name]!(context)),
    );
  }
}
