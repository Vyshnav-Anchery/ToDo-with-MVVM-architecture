import 'package:flutter/material.dart';
import '../../utils/todo_database.dart';
import '../models/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  int bottomNavIndex = 0;
  final TodoDatabase _database;

  TodoViewModel(this._database);

  List<Todo> get todos => _database.todoBox.values.toList();

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  Future<void> addTodo(String title) async {
    final todo = Todo(title: title);
    await _database.todoBox.add(todo);
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
