import '../../features/auth/model/user_model.dart';

class UserStore {
  static final List<UserModel> _users = [];

  static UserModel? currentUser;

  // quando o usuário se cadastro joga pra lista
  static void addUser(UserModel user) {
    _users.add(user);
  }

  static UserModel? login(String email, String password) {
    // login verifica a lista
    for (var user in _users) {
      // Se encontrar o login funciona, se não returna null
      if (user.email == email && user.password == password) {
        currentUser = user;
        return user;
      }
    }
    return null;
  }
}
