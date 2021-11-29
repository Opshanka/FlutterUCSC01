class ToHomePageArguments {
  final String title;

  ToHomePageArguments({required this.title});
}

class ToUserListPageArguments {
  final String title;
  final String numberOfUsers;
  ToUserListPageArguments({required this.title, required this.numberOfUsers});
}

class ToUserProfilePageArguments {
  final String title;
  final String name;
  final String email;
  final int mobile;
  ToUserProfilePageArguments({required this.title, required this.name,required this.email,required this.mobile});
}