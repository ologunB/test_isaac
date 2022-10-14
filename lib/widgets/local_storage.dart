import 'package:hive_flutter/hive_flutter.dart';

const String kBox = 'userBox';
const String kName = 'namae';
const String kUser = 'user';
const String hasRated = 'hasRated';

class AppCache {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kBox);
  }

  static Box<dynamic> get _box => Hive.box<dynamic>(kBox);

  String a = '';

  static void saveName(String token) {
    _box.put(kName, token);
  }

  static String getName() {
    final String data = _box.get(kName) as String;
    return data;
  }
}
