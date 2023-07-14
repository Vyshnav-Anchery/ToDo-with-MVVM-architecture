import 'package:hive_flutter/hive_flutter.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  late String? title;

  @HiveField(1)
  late bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });
}

@HiveType(typeId: 2)
class NotesModel {
  @HiveField(0)
  late String? noteTitle;

  @HiveField(1)
  late String? notebody;

  NotesModel({
    required this.noteTitle,
    required this.notebody,
  });
}
