import 'package:demo/common/arguments.dart';
import 'package:flutter/material.dart';
class Users extends StatefulWidget {
  final users;
  const Users({this.users, Key? key }) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text( widget.users.title.toString()),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Number of Users : ${widget.users.numberOfUsers.toString()}"),
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