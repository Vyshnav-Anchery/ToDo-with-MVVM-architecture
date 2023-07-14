import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/views/screens/notes_screen.dart';
import 'package:stateless_statefull/views/screens/todo_screen.dart';

import '../../view_models/todo_view_model.dart';
import '../widgets/bottomnavigation.dart';

class BotomNavBar extends StatelessWidget {
  BotomNavBar({super.key});
  final screens = [
    NotesScreen(),
    TodoScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);
    return Scaffold(
      body: screens[viewModel.bottomNavIndex],
      bottomNavigationBar: bottomNavigator(viewModel),
    );
  }
}
