import 'package:demo/extensions/colors.dart';
import 'package:flutter/material.dart';

ThemeData primaryTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Lato',
  primaryColor: HexColor.fromHex("#4caf50"),
  primarySwatch: MaterialColor(
    //https://api.flutter.dev/flutter/material/Colors-class.html
    5025616,
    <int, Color>{
      50: HexColor.fromHex("#e8f5e9"),
      100: HexColor.fromHex("#c8e6c9"),
      200: HexColor.fromHex("#a5d6a7"),
      300: HexColor.fromHex("#81c784"),
      400: HexColor.fromHex("#66bb6a"),
      500: HexColor.fromHex("#4caf50"),
      600: HexColor.fromHex("#43a047"),
      700: HexColor.fromHex("#388e3c"),
      800: HexColor.fromHex("#2e7d32"),
      900: HexColor.fromHex("#1b5e20")
    },
  ),
<<<<<<< HEAD
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor.fromHex("#4caf50"),
  )
=======
>>>>>>> c3901e00800af4d5031614ee2fa9fa034ec32cd5
);