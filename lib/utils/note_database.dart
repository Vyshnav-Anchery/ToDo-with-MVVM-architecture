import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo_model.dart';

class NoteDatabase {
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NotesModelAdapter());
    await Hive.openBox<NotesModel>("notes");
  }

  Box<NotesModel> get notesBox => Hive.box<NotesModel>("notes");
}
