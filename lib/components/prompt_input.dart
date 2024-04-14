import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';

class PromptInput extends StatelessWidget {
  final TextEditingController controller;
  const PromptInput({Key? key, required this.controller}) : super(key: key);
  TextStyle hintStyle(ChatZenPaletteExtension palette, ThemeData theme) {
    return MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return TextStyle(
            color: palette.inputErrorHint,
            fontSize: theme.textTheme.bodySmall?.fontSize);
      } else if (states.contains(MaterialState.focused)) {
        return TextStyle(
            color: palette.inputFocusedHint,
            fontSize: theme.textTheme.bodySmall?.fontSize);
      }
      return TextStyle(
          color: palette.primaryInputHint,
          fontSize: theme.textTheme.bodySmall?.fontSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    ChatZenPaletteExtension palette = context.theme.palette;
    ThemeData theme = Theme.of(context);
    return TextFormField(
      style: TextStyle(
        fontSize: theme.textTheme.bodySmall?.fontSize,
      ),
      cursorColor: palette.primary,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: Container(
          width: 16,
          height: 16,
          padding: EdgeInsets.all(4),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic_rounded,
                size: 20,
                color: palette.primaryInputHint,
              )),
        ),
        hintText: "Type a message to Bobo...",
        hintStyle: hintStyle(palette, theme),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        fillColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.focused)
              ? palette.primaryInputFocusedBackground
              : palette.primaryInputBackground,
        ),
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: palette.primary,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
