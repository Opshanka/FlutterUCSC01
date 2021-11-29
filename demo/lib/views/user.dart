import 'package:demo/common/arguments.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final user;
  const UserProfile({this.user, Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.title.toString()),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.user.name.toString()),
            Text(widget.user.email.toString()),
            Text(widget.user.mobile.toString()),
            SizedBox(
              height: height * 0.01,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.pushNamed(
                  context,
                  "/",
                ),
              },
              child: Text("To Home"),
            ),
          ],
        ),
      ),
    );
  }
}
