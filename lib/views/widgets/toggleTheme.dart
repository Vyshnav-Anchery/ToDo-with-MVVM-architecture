import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/todo_view_model.dart';

IconButton themeToggle(context) {
  final viewModel = Provider.of<TodoViewModel>(context);
  return IconButton(
    onPressed: () => viewModel.toggleTheme(),
    icon: Icon(
      Icons.dark_mode,
      color: viewModel.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}
