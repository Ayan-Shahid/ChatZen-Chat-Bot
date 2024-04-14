import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {Key? key,
      this.placeholder,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.validate,
      this.visibility})
      : super(key: key);
  final String? placeholder;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool? visibility;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validate;

  Color iconColor(ChatZenPaletteExtension palette) {
    return MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return palette.error;
      } else if (states.contains(MaterialState.focused)) {
        return palette.primary;
      }
      return palette.primaryInputHint;
    });
  }

  Color fillColor(ChatZenPaletteExtension palette) {
    return MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return palette.primaryInputErrorBackground;
      } else if (states.contains(MaterialState.focused)) {
        return palette.primaryInputFocusedBackground;
      }
      return palette.primaryInputBackground;
    });
  }

  TextStyle hintStyle(ChatZenPaletteExtension palette) {
    return MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return TextStyle(color: palette.inputErrorHint);
      } else if (states.contains(MaterialState.focused)) {
        return TextStyle(color: palette.inputFocusedHint);
      }
      return TextStyle(color: palette.primaryInputHint);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ChatZenPaletteExtension palette = context.theme.palette;
    return TextFormField(
      validator: validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: visibility ?? false,
      keyboardType: keyboardType,
      style: TextStyle(
          fontSize: theme.textTheme.bodySmall?.fontSize,
          color: palette.foreground),
      cursorColor: palette.primary,
      decoration: InputDecoration(
          errorStyle: TextStyle(color: palette.error),
          prefixIconColor: iconColor(palette),
          suffixIconColor: iconColor(palette),
          hintText: placeholder,
          hintStyle: hintStyle(palette),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: palette.error, width: 2),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: palette.primary, width: 2),
              borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)),
          fillColor: fillColor(palette),
          filled: true),
    );
  }
}
