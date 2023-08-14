import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/utils/constants/constants.dart';
import 'package:stateless_statefull/utils/note_database.dart';
import 'package:stateless_statefull/features/notes/notes_view_model/notes_view_model.dart';
import 'package:stateless_statefull/features/home/home_view_model/theme_view_model.dart';
import 'package:stateless_statefull/features/home/ui/home_screen.dart';
import 'features/todo/todo_view_model/todo_view_model.dart';
import 'utils/todo_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize and open the database instances
  final database = TodoDatabase();
  await database.init();

  final notesDatabase = NoteDatabase();
  await notesDatabase.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoViewModel>(
          create: (context) => TodoViewModel(database),
        ),
        ChangeNotifierProvider<NoteViewModel>(
          create: (context) => NoteViewModel(notesDatabase),
        ),
        ChangeNotifierProvider<ThemeViewModel>(
          create: (context) => ThemeViewModel(),
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
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    return MaterialApp(
      theme: themeViewModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: todoAppBarTitle,
      home: BotomNavBar(),
    );
  }
}
