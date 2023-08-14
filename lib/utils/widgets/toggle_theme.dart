import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/home_view_model/theme_view_model.dart';

IconButton themeToggle(context) {
  final themeViewModel = Provider.of<ThemeViewModel>(context);

  return IconButton(
    onPressed: () => themeViewModel.toggleTheme(),
    icon: Icon(
      themeViewModel.isDarkMode ? Icons.light_mode : Icons.dark_mode,
      color: themeViewModel.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}
