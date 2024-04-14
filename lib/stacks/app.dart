import 'package:chatzen/keys/navigator_keys.dart';
import 'package:chatzen/screens/home.dart';
import 'package:chatzen/screens/settings.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      '/': (context) => const Home(),
      '/settings': (context) => const Settings()
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);
    return Navigator(
      key: NavigatorKeys.mainStackNavigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => routeBuilders[settings.name]!(context)),
    );
  }
}
