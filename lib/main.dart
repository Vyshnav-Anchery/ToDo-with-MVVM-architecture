import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/utils/constants.dart';
import 'package:stateless_statefull/utils/note_database.dart';
import 'package:stateless_statefull/view_models/notes_view_model.dart';
import 'package:stateless_statefull/views/screens/home_screen.dart';
import 'utils/todo_database.dart';
import 'view_models/todo_view_model.dart';

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
        Provider<TodoDatabase>.value(value: database),
        Provider<NoteDatabase>.value(value: notesDatabase),
        ChangeNotifierProvider<TodoViewModel>(
          create: (context) => TodoViewModel(database),
        ),
        ChangeNotifierProvider<NoteViewModel>(
          create: (context) => NoteViewModel(notesDatabase),
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
    final viewModel = Provider.of<TodoViewModel>(context);
    return MaterialApp(
      theme: viewModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: todoAppBarTitle,
      home: BotomNavBar(),
    );
  }
}
