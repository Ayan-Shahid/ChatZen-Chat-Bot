import 'package:flutter/material.dart';

abstract class NavigatorKeys {
  static final GlobalKey<NavigatorState> authStackNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> mainStackNavigatorKey =
      GlobalKey<NavigatorState>();
}
