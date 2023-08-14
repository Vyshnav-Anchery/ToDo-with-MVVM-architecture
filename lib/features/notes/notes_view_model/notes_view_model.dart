import 'package:flutter/material.dart';

import '../../../utils/note_database.dart';
import '../model/notes_model.dart';

class NoteViewModel extends ChangeNotifier {
  final NoteDatabase _noteDatabase;
  NoteViewModel(this._noteDatabase);
  List get notes => _noteDatabase.notesBox.values.toList();
  
  Future<void> addNotes(String title, String body) async {
    final note = NotesModel(noteTitle: title, notebody: body);
    await _noteDatabase.notesBox.add(note);
    notifyListeners();
  }

  Future<void> deleteNotes(int index) async {
    await _noteDatabase.notesBox.deleteAt(index);
    notifyListeners();
  }

  Future<void> editNotes(int index, NotesModel value) async {
    await _noteDatabase.notesBox.putAt(index, value);
    notifyListeners();
  }
}
