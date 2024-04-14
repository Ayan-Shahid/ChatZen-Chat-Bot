import 'package:chatzen/components/form_button.dart';
import 'package:chatzen/components/password_input.dart';
import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool rememberMe = false;
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
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_rounded)),
        title: Text("Create New Password",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: theme.textTheme.titleLarge?.fontSize)),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SvgPicture.asset(
                "assets/illustrations/Bot.svg",
                width: width * 0.6,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Create Your New Password",
              style: TextStyle(
                  fontSize: theme.textTheme.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 16,
            ),
            PasswordInput(),
            const SizedBox(
              height: 24,
            ),
            PasswordInput(),
            const Spacer(),
            FormButton()
          ],
        ),
      )),
    );
  }
}
