import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/utils/constants.dart';
import 'package:stateless_statefull/views/screens/home_screen.dart';
import 'utils/todo_database.dart';
import 'view_models/todo_view_model.dart';

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
      title: todoAppBarTitle,
      theme: appTheme,
      home: BotomNavBar(),
    );
  }
}
