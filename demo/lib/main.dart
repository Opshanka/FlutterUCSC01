import 'package:demo/common/route_generator.dart';
import 'package:demo/common/theme.dart';
import 'package:demo/views/first_page.dart';
import 'package:demo/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: primaryTheme,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // onGenerateRoute: RouteGenerator.gener,
      home: Home(title: "Home Page"),
    );
  }
}
