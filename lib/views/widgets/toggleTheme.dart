import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/theme_view_model.dart';

IconButton themeToggle(context) {
  final themeViewModel = Provider.of<ThemeViewModel>(context);

  return IconButton(
    onPressed: () => themeViewModel.toggleTheme(),
    icon: Icon(
      Icons.dark_mode,
      color: themeViewModel.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}
