import 'package:flutter/material.dart';

abstract class ChatZenPalette {
  static const pimary = _PrimaryColor();
  static const grey = _GrayScaleColor();
  static const error = _ErrorColor();
}

class _PrimaryColor {
  const _PrimaryColor();

  final primary100 = const Color(0xff000614);
  final primary200 = const Color(0xff001A52);
  final primary300 = const Color(0xff002D8F);
  final primary400 = const Color(0xff0041CC);
  final primary500 = const Color(0xff004FFF);
  final primary600 = const Color(0xff4782FF);
  final primary700 = const Color(0xff85ABFF);
  final primary800 = const Color(0xffC2D5FF);
  final primary900 = const Color(0xffEBF1FF);
}

class _GrayScaleColor {
  const _GrayScaleColor();
  final gray100 = const Color(0xff08090D);
  final gray200 = const Color(0xff0F121A);
  final gray300 = const Color(0xff171B26);
  final gray400 = const Color(0xff1F2433);
  final gray500 = const Color(0xff262D40);
  final gray600 = const Color(0xff8C99BA);
  final gray700 = const Color(0xffA6B0C9);
  final gray800 = const Color(0xffBFC6D9);
  final gray900 = const Color(0xffD9DDE8);
  final gray1000 = const Color(0xffF2F4F7);
}

class _ErrorColor {
  const _ErrorColor();
  final error100 = const Color(0xff290000);
  final error200 = const Color(0xff3D0000);
  final error300 = const Color(0xff7A0000);
  final error400 = const Color(0xffB80000);
  final error500 = const Color(0xffF50000);
  final error600 = const Color(0xffFF3333);
  final error700 = const Color(0xffFF7070);
  final error800 = const Color(0xffFFADAD);
  final error900 = const Color(0xffFFEBEB);
}

class ChatZenPaletteExtension extends ThemeExtension<ChatZenPaletteExtension> {
  ChatZenPaletteExtension(
      {required this.background,
      required this.foreground,
      required this.primary,
      required this.onPrimary,
      required this.container,
      required this.primaryInputBackground,
      required this.primaryInputForeground,
      required this.primaryInputHint,
      required this.primaryInputFocusedBackground,
      required this.error,
      required this.inputErrorHint,
      required this.primaryInputErrorBackground,
      required this.inputFocusedHint,
      required this.primaryButtonDisabledBackground,
      required this.onError});
  final Color background;
  final Color foreground;
  final Color primary;
  final Color onPrimary;
  final Color container;
  final Color primaryInputBackground;
  final Color primaryInputForeground;
  final Color primaryInputHint;
  final Color primaryInputFocusedBackground;
  final Color error;
  final Color onError;
  final Color inputErrorHint;
  final Color inputFocusedHint;
  final Color primaryButtonDisabledBackground;
  final Color primaryInputErrorBackground;

  @override
  ThemeExtension<ChatZenPaletteExtension> copyWith(
      {Color? background,
      Color? foreground,
      Color? primaryInputFocusedBorder,
      Color? primary,
      Color? onPrimary,
      Color? container,
      Color? primaryInputBackground,
      Color? primaryInputForeground,
      Color? primaryInputHint,
      Color? error,
      Color? onError,
      Color? inputErrorHint,
      Color? inputFocusedHint,
      Color? primaryInputErrorBackground,
      Color? primaryButtonDisabledBackground,
      Color? primaryInputFocusedBackground}) {
    return ChatZenPaletteExtension(
        primaryInputErrorBackground:
            primaryInputErrorBackground ?? this.primaryInputErrorBackground,
        primaryButtonDisabledBackground: primaryButtonDisabledBackground ??
            this.primaryButtonDisabledBackground,
        error: error ?? this.error,
        inputErrorHint: inputErrorHint ?? this.inputErrorHint,
        inputFocusedHint: inputFocusedHint ?? this.inputFocusedHint,
        onError: onError ?? this.onError,
        primaryInputFocusedBackground:
            primaryInputFocusedBackground ?? this.primaryInputFocusedBackground,
        background: background ?? this.background,
        foreground: foreground ?? this.foreground,
        primary: primary ?? this.primary,
        onPrimary: onPrimary ?? this.onPrimary,
        container: container ?? this.container,
        primaryInputBackground:
            primaryInputBackground ?? this.primaryInputBackground,
        primaryInputForeground:
            primaryInputForeground ?? this.primaryInputForeground,
        primaryInputHint: primaryInputHint ?? this.primaryInputHint);
  }

  @override
  ThemeExtension<ChatZenPaletteExtension> lerp(
      covariant ThemeExtension<ChatZenPaletteExtension>? other, double t) {
    if (other is! ChatZenPaletteExtension) {
      return this;
    }
    return ChatZenPaletteExtension(
        primaryInputErrorBackground: Color.lerp(
            primaryInputErrorBackground, other.primaryInputErrorBackground, t)!,
        primaryButtonDisabledBackground: Color.lerp(
            primaryButtonDisabledBackground,
            other.primaryButtonDisabledBackground,
            t)!,
        error: Color.lerp(error, other.error, t)!,
        inputErrorHint: Color.lerp(inputErrorHint, other.inputErrorHint, t)!,
        inputFocusedHint:
            Color.lerp(inputFocusedHint, other.inputFocusedHint, t)!,
        onError: Color.lerp(onError, other.onError, t)!,
        primaryInputFocusedBackground: Color.lerp(primaryInputFocusedBackground,
            other.primaryInputFocusedBackground, t)!,
        background: Color.lerp(background, other.background, t)!,
        foreground: Color.lerp(foreground, other.foreground, t)!,
        primary: Color.lerp(primary, other.primary, t)!,
        onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
        container: Color.lerp(container, other.container, t)!,
        primaryInputBackground: Color.lerp(
            primaryInputBackground, other.primaryInputBackground, t)!,
        primaryInputForeground: Color.lerp(
            primaryInputForeground, other.primaryInputForeground, t)!,
        primaryInputHint:
            Color.lerp(primaryInputHint, other.primaryInputHint, t)!);
  }
}

class ChatZenTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  static final lightPalette = ChatZenPaletteExtension(
      primaryButtonDisabledBackground: ChatZenPalette.pimary.primary700,
      inputErrorHint: ChatZenPalette.error.error800,
      inputFocusedHint: ChatZenPalette.pimary.primary700,
      error: ChatZenPalette.error.error500,
      onError: ChatZenPalette.error.error900,
      primaryInputErrorBackground: ChatZenPalette.error.error900,
      background: ChatZenPalette.grey.gray1000,
      primaryInputFocusedBackground: ChatZenPalette.pimary.primary800,
      foreground: ChatZenPalette.grey.gray100,
      primary: ChatZenPalette.pimary.primary500,
      onPrimary: ChatZenPalette.pimary.primary900,
      container: ChatZenPalette.grey.gray900,
      primaryInputBackground: ChatZenPalette.grey.gray900,
      primaryInputForeground: ChatZenPalette.grey.gray100,
      primaryInputHint: ChatZenPalette.grey.gray600);

  static final light = ThemeData.light().copyWith(extensions: [lightPalette]);
  static final darkPalette = ChatZenPaletteExtension(
      primaryButtonDisabledBackground: ChatZenPalette.pimary.primary700,
      inputErrorHint: ChatZenPalette.error.error300,
      inputFocusedHint: ChatZenPalette.pimary.primary200,
      error: ChatZenPalette.error.error500,
      onError: ChatZenPalette.error.error900,
      background: ChatZenPalette.grey.gray100,
      primaryInputFocusedBackground: ChatZenPalette.pimary.primary100,
      primaryInputErrorBackground: ChatZenPalette.error.error100,
      foreground: ChatZenPalette.grey.gray1000,
      primary: ChatZenPalette.pimary.primary500,
      onPrimary: ChatZenPalette.pimary.primary900,
      container: ChatZenPalette.grey.gray200,
      primaryInputBackground: ChatZenPalette.grey.gray200,
      primaryInputForeground: ChatZenPalette.grey.gray1000,
      primaryInputHint: ChatZenPalette.grey.gray500);

  static final dark = ThemeData.dark().copyWith(extensions: [darkPalette]);
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  ChatZenPaletteExtension get palette =>
      extension<ChatZenPaletteExtension>() ?? ChatZenTheme.lightPalette;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
