import 'package:hive_flutter/hive_flutter.dart';
part 'notes_model.g.dart';

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