import 'package:demo/common/arguments.dart';
import 'package:demo/common/theme.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final title;
  const Home({Key? key, required this.title}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: const Center(
        child: Text("Home Page"),
      )
    );
  }
}
