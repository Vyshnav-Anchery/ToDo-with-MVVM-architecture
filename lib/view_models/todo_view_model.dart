import 'package:flutter/material.dart';
import 'package:stateless_statefull/utils/note_database.dart';
import '../../utils/todo_database.dart';
import '../models/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  int bottomNavIndex = 0;
  final TodoDatabase _database;
  final NoteDatabase _noteDatabase;

  TodoViewModel(this._database,this._noteDatabase);

  List<Todo> get todos => _database.todoBox.values.toList();
  List<NotesModel> get notes => _noteDatabase.notesBox.values.toList();

  Future<void> addTodo(String title) async {
    final todo = Todo(title: title);
    await _database.todoBox.add(todo);
    notifyListeners();
  }

  Future<void> addNotes(String title, String body) async {
    final note = NotesModel(noteTitle: title, notebody: body);
    await _noteDatabase.notesBox.add(note);
    notifyListeners();
  }

  Future<void> toggleTodoStatus(int index) async {
    final todo = _database.todoBox.getAt(index);
    if (todo != null) {
      todo.isDone = !todo.isDone;
      await todo.save();
      notifyListeners();
    }
  }

  Future<void> deleteTodo(int index) async {
    await _database.todoBox.deleteAt(index);
    notifyListeners();
  }

  Future<void> editTodo(int index, Todo value) async {
    await _database.todoBox.putAt(index, value);
    notifyListeners();
  }

  Future<void> bottomNav(value) async {
    bottomNavIndex = value;
    notifyListeners();
  }
}
