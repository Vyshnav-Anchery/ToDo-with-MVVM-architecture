import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/todo_model.dart';
import '../../../utils/constants.dart';
import '../../../view_models/todo_view_model.dart';
import '../cancellbutton.dart';

Future<dynamic> editNotes(BuildContext context, int index) {
  final viewModel = Provider.of<TodoViewModel>(context, listen: false);
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editbodyController = TextEditingController();
  final note = viewModel.notes[index];

  return showDialog(
    context: context,
    builder: (context) {
      editTitleController.text = "${note.noteTitle}";
      editbodyController.text = note.notebody!;
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: editTitleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                maxLines: null,
                controller: editbodyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              var values = NotesModel(
                  noteTitle: editTitleController.text,
                  notebody: editbodyController.text);
              viewModel.editNotes(index, values);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: saveText,
          ),
          const CancellBttn(),
        ],
      );
    },
  );
}
