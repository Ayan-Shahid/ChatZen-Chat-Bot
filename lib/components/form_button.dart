import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';

enum FormButtonAuthState { normal, validating, success, error }

class FormButton extends StatefulWidget {
  const FormButton({Key? key}) : super(key: key);

  @override
  _FormButtonState createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  FormButtonAuthState buttonState = FormButtonAuthState.normal;
  Widget showChild(ThemeData theme, ChatZenPaletteExtension palette) {
    if (buttonState == FormButtonAuthState.validating) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: palette.onPrimary,
        ),
      );
    } else if (buttonState == FormButtonAuthState.success) {
      return Icon(
        Icons.check,
        color: palette.onPrimary,
        size: 18,
      );
    } else if (buttonState == FormButtonAuthState.error) {
      return Icon(
        Icons.close,
        color: palette.onPrimary,
        size: 20,
      );
    }
    return Text(
      "Sign In",
      style: TextStyle(
        fontSize: theme.textTheme.bodySmall?.fontSize,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ChatZenPaletteExtension palette = context.theme.palette;
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            disabledBackgroundColor: palette.primaryButtonDisabledBackground,
            disabledForegroundColor: palette.onPrimary,
            fixedSize: Size(width, 52),
            padding: EdgeInsets.symmetric(vertical: 16),
            elevation: 0.0,
            backgroundColor: palette.primary,
            foregroundColor: palette.onPrimary),
        child: showChild(theme, palette));
  }
}
