class User {
  final String username;
  String name, password;

  User({required this.name, required this.username, required this.password});

  static bool matchPassword(String inputPassword, String userPassword) {
    return inputPassword == userPassword;
  }
}
