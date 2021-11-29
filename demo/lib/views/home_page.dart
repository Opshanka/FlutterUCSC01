import 'package:demo/common/arguments.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final title;

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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
            height: height * 0.01,
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.of(context).pushNamed(
               "/userprofile",
                  arguments: ToUserProfilePageArguments(
                      title: "User Profile",
                      name: "Opshanka",
                      email: "opibabeykoon@gmail.com",
                      mobile: 070130163,),),
            },
            child: Text("User Profile"),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.of(context).pushNamed(
                "/users",
                arguments: ToUserListPageArguments(
                  title: "User List",
                  numberOfUsers: 10.toString(),
                ),
              ),
            },
            child: Text("Users"),
          ),
        ]),
      ),
    );
  }
}
