import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/todo_database.dart';
import 'view_models/todo_view_model.dart';
import 'views/todo_screen.dart';

void main() async {
  final database = TodoDatabase();
  await database.init();

  runApp(
    MultiProvider(
      providers: [
        Provider<TodoDatabase>.value(value: database),
        ChangeNotifierProvider<TodoViewModel>(
          create: (_) => TodoViewModel(database),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoScreen(),
    );
  }
}
