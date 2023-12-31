import 'package:hive_flutter/hive_flutter.dart';
import '../features/todo/model/todo_model.dart';
import 'constants/constants.dart';

class TodoDatabase {
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());
    await Hive.openBox<Todo>(boxName);
  }

  Box<Todo> get todoBox => Hive.box<Todo>(boxName);
}
