import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool darkMode = false;
  setThemeMode() {
    setState(() {
      darkMode = !darkMode;
    });

    if (darkMode == true) {
      context.read<ChatZenTheme>().themeMode = ThemeMode.dark;
    } else {
      context.read<ChatZenTheme>().themeMode = ThemeMode.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    ChatZenPaletteExtension palette = context.theme.palette;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: palette.background,
      appBar: AppBar(
        backgroundColor: palette.background,
        foregroundColor: palette.foreground,
        centerTitle: false,
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_rounded)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: palette.container),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                        style: IconButton.styleFrom(
                            foregroundColor: palette.onPrimary,
                            backgroundColor: palette.primary),
                        onPressed: () {},
                        icon: Icon(Icons.edit)))
              ],
            ),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            cursorColor: palette.primary,
            enabled: false,
            initialValue: "ayan",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: palette.foreground,
                fontSize: theme.textTheme.titleLarge?.fontSize),
            decoration: InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.zero),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            cursorColor: palette.primary,
            enabled: false,
            initialValue: "ayan@gmail.com",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: palette.foreground,
                fontSize: theme.textTheme.titleSmall?.fontSize),
            decoration: InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.zero),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              thickness: 1,
              color: palette.container,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          OutlinedButton(
              onPressed: setThemeMode,
              style: OutlinedButton.styleFrom(
                  foregroundColor: palette.foreground,
                  shape: BeveledRectangleBorder(),
                  side: BorderSide.none),
              child: Row(
                children: [
                  Icon(Icons.dark_mode_outlined),
                  const SizedBox(
                    width: 16,
                  ),
                  Text("Dark Mode"),
                  const Spacer(),
                  Switch(
                    value: darkMode,
                    onChanged: (value) {
                      setThemeMode();
                      setState(() {
                        darkMode = value;
                      });
                    },
                    inactiveThumbColor: palette.background,
                    inactiveTrackColor: palette.container,
                    trackOutlineColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    activeColor: palette.primary,
                  )
                ],
              )),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  foregroundColor: palette.error,
                  shape: BeveledRectangleBorder(),
                  side: BorderSide.none),
              child: Row(
                children: [
                  Icon(Icons.logout),
                  const SizedBox(
                    width: 16,
                  ),
                  Text("Logout"),
                ],
              ))
        ],
      )),
    );
  }
}
