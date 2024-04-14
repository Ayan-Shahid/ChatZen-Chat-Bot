import 'package:chatzen/stacks/app.dart';
import 'package:chatzen/stacks/auth.dart';
import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatZenTheme(),
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: ChatZenTheme.light,
        debugShowCheckedModeBanner: false,
        darkTheme: ChatZenTheme.dark,
        themeMode: context.watch<ChatZenTheme>().themeMode,
        home: const App(),
      ),
    );
  }
}
