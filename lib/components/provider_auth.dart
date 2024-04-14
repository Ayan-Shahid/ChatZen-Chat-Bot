import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProviderAuth extends StatelessWidget {
  const ProviderAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatZenPaletteExtension palette = context.theme.palette;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: palette.container),
                foregroundColor: palette.foreground,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: SvgPicture.asset("assets/icons/Google.svg")),
        const SizedBox(
          width: 24,
        ),
        OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: palette.container),
                foregroundColor: palette.foreground,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: SvgPicture.asset("assets/icons/FaceBook.svg")),
        const SizedBox(
          width: 24,
        ),
        OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: palette.container),
                foregroundColor: palette.foreground,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: SvgPicture.asset(
              "assets/icons/Apple.svg",
              color: palette.foreground,
            ))
      ],
    );
  }
}
