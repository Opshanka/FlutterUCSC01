import 'package:flutter/material.dart';

PreferredSizeWidget appBar(title, context) {
  return AppBar(
    title:
        Text(title, style: Theme.of(context).appBarTheme.textTheme!.headline4),
  );
}
