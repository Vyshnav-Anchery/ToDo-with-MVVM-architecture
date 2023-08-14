import 'package:hive_flutter/hive_flutter.dart';
import 'package:stateless_statefull/utils/constants/constants.dart';

import '../features/notes/model/notes_model.dart';

class NoteDatabase {
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NotesModelAdapter());
    await Hive.openBox<NotesModel>(noteName);
  }

  Box<NotesModel> get notesBox => Hive.box<NotesModel>(noteName);
}
