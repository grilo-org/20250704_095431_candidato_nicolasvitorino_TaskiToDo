import 'package:hive/hive.dart';
import 'package:taski_todo/data/models/user.dart';

class UserRepository {
  static const String _boxName = "userBox";
  late Box<UserModel> _userBox;

  Future<void> init() async {
    _userBox = await Hive.openBox<UserModel>(_boxName);
  }

  Future<void> saveUser(UserModel user) async {
    await _userBox.put("user", user);
  }

  UserModel? getUser() {
    return _userBox.get("user");
  }
}
