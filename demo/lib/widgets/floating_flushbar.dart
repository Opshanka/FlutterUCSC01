import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

Future<void> showFloatingFlushbar(BuildContext context, message) async {
  double height = MediaQuery.of(context).size.height;
     await Flushbar(
       padding:const EdgeInsets.all(10),
       margin: EdgeInsets.fromLTRB(15, 23, 15, height / 100 * 5),
       dismissDirection: FlushbarDismissDirection.HORIZONTAL,

            message:
                message,
            duration: Duration(seconds: 3),
          ).show(context);
}