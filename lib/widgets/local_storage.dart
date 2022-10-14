import 'package:flagmodeapp12/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String kBox = 'userBox';
const String kUser = 'user';
const String hasRated = 'hasRated';

class AppCache {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kBox);
  }

  static Box<dynamic> get _box => Hive.box<dynamic>(kBox);

  String a = '';

  static void saveUser(dynamic data) {
    _box.put(kUser, data);
  }

  static UserModel getUser() {
    final dynamic data = _box.get(kUser);
    return UserModel.fromJson(data);
  }
}
