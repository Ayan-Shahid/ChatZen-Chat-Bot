import 'package:chatzen/components/email_input.dart';
import 'package:chatzen/components/form_button.dart';

import 'package:chatzen/components/password_input.dart';
import 'package:chatzen/components/provider_auth.dart';
import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    ChatZenPaletteExtension palette = context.theme.palette;
    return Scaffold(
      backgroundColor: palette.background,
      appBar: AppBar(
        backgroundColor: palette.background,
        foregroundColor: palette.foreground,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_rounded)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              "Login To Your Account",
              style: TextStyle(
                  fontSize: theme.textTheme.displayMedium?.fontSize,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            Form(
                key: form,
                child: Column(
                  children: [
                    EmailInput(),
                    const SizedBox(
                      height: 24,
                    ),
                    PasswordInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          hoverColor: palette.foreground,
                          value: rememberMe,
                          checkColor: palette.onPrimary,
                          activeColor: palette.primary,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                          side: BorderSide(color: palette.primary, width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: theme.textTheme.bodySmall?.fontSize),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormButton(),
                  ],
                )),
            const SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: palette.primary),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: theme.textTheme.bodySmall?.fontSize),
                )),
            const SizedBox(
              height: 40,
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
                  "or continue with",
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
            ProviderAuth(),
            const SizedBox(
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
