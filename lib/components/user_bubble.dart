import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';

class UserBubble extends StatelessWidget {
  final String text;
  const UserBubble({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    ChatZenPaletteExtension palette = context.theme.palette;
    return Container(
      constraints: BoxConstraints(maxWidth: width * 0.8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
          color: palette.primary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(8))),
      child: Text(text,
          style: theme.textTheme.bodySmall?.copyWith(color: palette.onPrimary)),
    );
  }
}
