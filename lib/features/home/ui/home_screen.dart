import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/features/notes/ui/notes_screen.dart';
import 'package:stateless_statefull/features/todo/ui/todo_screen.dart';
import '../../../utils/widgets/bottom_navigation.dart';
import '../../todo/todo_view_model/todo_view_model.dart';

class BotomNavBar extends StatelessWidget {
  BotomNavBar({super.key});
  final screens = [
    const NotesScreen(),
    const TodoScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoViewModel>(context);
    return Scaffold(
      body: screens[provider.bottomNavIndex],
      bottomNavigationBar: bottomNavigator(provider),
    );
  }
}
