import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    ChatZenPaletteExtension palette = context.theme.palette;
    return Scaffold(
      backgroundColor: palette.background,
      appBar: AppBar(
        backgroundColor: palette.background,
        foregroundColor: palette.foreground,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/illustrations/Bot.svg",
              width: width * 0.6,
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                "Let's You In",
                style: TextStyle(
                    fontSize: theme.textTheme.displayMedium?.fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: palette.container),
                    fixedSize: Size.fromWidth(width),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    elevation: 0.0,
                    foregroundColor: palette.foreground),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Google.svg",
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Continue With Google",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 16,
            ),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: palette.container),
                    fixedSize: Size.fromWidth(width),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    elevation: 0.0,
                    foregroundColor: palette.foreground),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/FaceBook.svg",
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Continue With FaceBook",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 16,
            ),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: palette.container),
                    fixedSize: Size.fromWidth(width),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    elevation: 0.0,
                    foregroundColor: palette.foreground),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Apple.svg",
                      color: palette.foreground,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Continue With Apple",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    width: width / 2,
                    decoration: ShapeDecoration(
                        shape: StadiumBorder(), color: palette.container),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  "or",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    width: width / 2,
                    decoration: ShapeDecoration(
                        shape: StadiumBorder(), color: palette.container),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(width),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    elevation: 0.0,
                    backgroundColor: palette.primary,
                    foregroundColor: palette.onPrimary),
                child: Text(
                  "Sign In With Password",
                )),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: palette.primaryInputHint,
                      fontSize: theme.textTheme.bodySmall?.fontSize),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    style:
                        TextButton.styleFrom(foregroundColor: palette.primary),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: theme.textTheme.bodySmall?.fontSize),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
