import 'package:flutter/material.dart';
import '../../view_models/todo_view_model.dart';

bottomNavigator(TodoViewModel notifier) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: false,
    currentIndex: notifier.bottomNavIndex,
    onTap: (value) => notifier.bottomNav(value),
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.note_add),
        label: "Add Note",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.check_box),
        label: "Add Todo",
      ),
    ],
  );
}
