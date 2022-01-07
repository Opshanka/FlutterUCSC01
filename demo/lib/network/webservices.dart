import 'package:connectivity/connectivity.dart';
import 'package:demo/common/utilities.dart';
import 'package:demo/models/industry_res.dart';
import 'package:demo/models/login_res.dart';
import 'package:demo/models/post.dart';
import 'package:demo/models/post_res.dart';
import 'package:demo/widgets/floating_flushbar.dart';
import 'package:demo/widgets/loader.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:http/http.dart' as http;
import 'package:demo/common/globals.dart' as global;
import 'dart:convert';
import 'package:flutter/material.dart';

Future<LoginResponse?> login(BuildContext context, username, password) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"email": username, "password": password};
      showLoader(context);
       var url = Uri.parse(global.LOGIN);
      final http.Response response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      stopLoader(context);
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(responseBody);
      } else if (response.statusCode == 400) {
        String message = responseBody['error'];
        showFloatingFlushbar(context, message);
        return null;
      } else {
        showFloatingFlushbar(context, 'errors.login'.tr());
        return null;
      }
    } catch (e) {
      showFloatingFlushbar(context, 'errors.login'.tr());
      return null;
    }
  } else {
    showFloatingFlushbar(context, 'errors.network'.tr());
    return null;
  }
}

Future<IndustryResponse?> getIndustries(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  var token = await Utilities.userToken();

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      showLoader(context);
        var url = Uri.parse(global.INDUSTRIES);
      final http.Response response =
          await http.get(url, headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      });
      var responseBody = json.decode(response.body);
      stopLoader(context);
      if (response.statusCode == 200) {
        return IndustryResponse.fromJson(responseBody);
      } else if (response.statusCode == 403) {
        showFloatingFlushbar(context, 'errors.industries'.tr());
        var isDelete = await Utilities.clearPreferences();
        Navigator.pushReplacementNamed(context, '/login');
        return null;
      } else {
        showFloatingFlushbar(context, 'errors.industries'.tr());
        return null;
      }
    } catch (e) {
      print(e);
      showFloatingFlushbar(context, 'errors.unknown'.tr());
      return null;
    }
  } else {
    showFloatingFlushbar(context, 'errors.network'.tr());
    return null;
  }
}

Future<Post> createPost(BuildContext context, body, title, userId) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"title": title, "body": body, "userId": userId};
      var url = Uri.parse(global.POSTS);
      final http.Response response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 201) {
        return Post.fromJson(responseBody);
      } else {
        return Post(title: "title", body: "body", userId: 0, id: 0);
      }
    } catch (e) {
      return Post(title: "title", body: "body", userId: 0, id: 0);
    }
  } else {
    return Post(title: "title", body: "body", userId: 0, id: 0);
  }
}

Future<Post> updatePost(BuildContext context, body, title, userId, id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"title": title, "body": body, "userId": userId};
      var url = Uri.parse(global.POSTS + "/$id");
      final http.Response response = await http.put(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else {
        return Post(title: "title", body: "body", userId: 0, id: 0);
      }
    } catch (e) {
      return Post(title: "title", body: "body", userId: 0, id: 0);
    }
  } else {
    return Post(title: "title", body: "body", userId: 0, id: 0);
  }
}

Future<Post> updatePostContent(BuildContext context, body, id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"body": body};
      var url = Uri.parse(global.POSTS + "/$id");
      final http.Response response = await http.patch(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else {
        return Post(title: "title", body: "body", userId: 0, id: 0);
      }
    } catch (e) {
      return Post(title: "title", body: "body", userId: 0, id: 0);
    }
  } else {
    return Post(title: "title", body: "body", userId: 0, id: 0);
  }
}

Future<Post> getPost(BuildContext context, String id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var url = Uri.parse(global.POSTS + "/$id");
      final http.Response response =
          await http.get(url, headers: {"Content-Type": "application/json"});
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else if (response.statusCode == 403) {
        print("Unauthorized");
        return Post(title: "title", body: "body", userId: 0, id: 0);
      } else {
        print("Error");
        return Post(title: "title", body: "body", userId: 0, id: 0);
      }
    } catch (e) {
      print(e);
      return Post(title: "title", body: "body", userId: 0, id: 0);
    }
  } else {
    return Post(title: "title", body: "body", userId: 0, id: 0);
  }
}

Future<PostsResponse> getPosts(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var url = Uri.parse(global.POSTS);
      final http.Response response =
          await http.get(url, headers: {"Content-Type": "application/json"});
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return PostsResponse.fromJson(responseBody);
      } else if (response.statusCode == 403) {
        print("Unauthorized");
        return PostsResponse(posts: new List<Post>.empty());
      } else {
        print("Error");
        return PostsResponse(posts: new List<Post>.empty());
      }
    } catch (e) {
      print(e);
      return PostsResponse(posts: new List<Post>.empty());
    }
  } else {
    return PostsResponse(posts: new List<Post>.empty());
  }
}

Future<bool?> deletePost(BuildContext context, int id) async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    //we have the connection
    try {
      var url = Uri.parse(global.POSTS + "/$id");

      final http.Response response = await http.delete(
        url, //url
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  } else {
    //we don't have connection, we can give error alert as No network
    return false;
  }
}
