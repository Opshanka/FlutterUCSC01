import 'package:demo/common/route_generator.dart';
import 'package:demo/common/theme.dart';
import 'package:demo/views/first_page.dart';
import 'package:demo/views/home_page.dart';
import 'package:demo/views/pages/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/langs', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
    ),
  );
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
      // home: Home(title: "Home Page"),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: LoginPage(),
    );
  }
}
