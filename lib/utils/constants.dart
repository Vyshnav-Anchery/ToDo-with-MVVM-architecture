import 'package:flutter/material.dart';

class ClassName {}

// titles
const String todoAppBarTitle = 'Todo App';
const Text notesAppBarTitle = Text('Notes');
const Text appBarTitle = Text('Todo');
const String addStringText = 'Add Todo';
const String addNoteTitleText = 'Add note title';
const String addNoteBodyText = 'Add note body';
const Text editText = Text("edit");
const Text saveText = Text("save");
const Text cancellText = Text("Cancel");

// theme
ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
);

// boxname
const String boxName = 'todos';
const String noteName = 'notes';

// style
TextStyle titleStyle = const TextStyle(fontWeight: FontWeight.w500, fontSize: 20);
TextStyle bodyStyle = const TextStyle(
  fontWeight: FontWeight.w300,
);
