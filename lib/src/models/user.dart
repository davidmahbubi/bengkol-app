class User {

  String name, username, password;

  User({required this.name, required this.username, required this.password});

  static bool matchPassword(String inputPassword, String userPassword) {
    return inputPassword == userPassword;
  }
}