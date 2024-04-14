import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ChatZenPaletteExtension palette = context.theme.palette;
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: palette.background,
      appBar: AppBar(
        backgroundColor: palette.background,
        foregroundColor: palette.foreground,
        centerTitle: false,
        title: Text(
          "Bobo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 24),
          child: SvgPicture.asset(
            "assets/illustrations/Bot.svg",
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.analytics_outlined)),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              },
              icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/illustrations/Bot Background.svg',
                  width: width,
                ),
                Positioned(
                  child: SvgPicture.asset(
                    "assets/illustrations/Bot.svg",
                    width: width * 0.6,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Welcome, Andrew! 👋",
              style: TextStyle(
                  fontSize: theme.textTheme.headlineLarge?.fontSize,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Let's Have Fun With Bobo!",
              style: TextStyle(
                  fontSize: theme.textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Start a conversation with Bobo right now!",
              style: TextStyle(
                  fontSize: theme.textTheme.bodyLarge?.fontSize,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    fixedSize: Size.fromWidth(width),
                    backgroundColor: palette.primary,
                    foregroundColor: palette.onPrimary,
                    padding: EdgeInsets.symmetric(vertical: 16)),
                onPressed: () {},
                child: Text(
                  "Start Chat With Bobo",
                  style:
                      TextStyle(fontSize: theme.textTheme.bodySmall?.fontSize),
                ))
          ],
        ),
      ),
    );
  }
}
