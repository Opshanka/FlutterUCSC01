import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  final title ;
  const FirstPage({this.title, Key? key }) : super(key: key);
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.title,
    );
  }
}