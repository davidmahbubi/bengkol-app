import './../models/user.dart';

class UserDatabase {

  List<User> users = [];

  void storeUser(User user) {
    users.add(user);
  }

  User? getUserByUsername(String username) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].username == username) {
        return users[i];
      }
    }
    return null;
  }

  List<User> getAllUsers() => users;
}