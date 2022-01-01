
import 'package:demo/common/arguments.dart';
import 'package:demo/views/first_page.dart';
import 'package:demo/views/home_page.dart';
import 'package:demo/views/user.dart';
import 'package:demo/views/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Home(title: "HomePage"));
      case '/firspage':
        return MaterialPageRoute(builder: (_)=> FirstPage(title: "FirstPage"));
      case '/userprofile':
        if(args is ToUserProfilePageArguments){
          return MaterialPageRoute(builder: (_)=> UserProfile(user: args,));
        }
        return _errorRoute("Profile Data Error");
      case '/users':
        if(args is ToUserListPageArguments){
          return MaterialPageRoute(builder: (_)=> UsersPage());
        }
        return _errorRoute("User List Data Error");
       default:
        return _errorRoute("No page Found");
    }
  }

}

 Route<dynamic> _errorRoute(String error){
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(child: Text(error),),

    );
  });
}