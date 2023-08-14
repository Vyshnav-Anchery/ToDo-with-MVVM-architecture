import 'package:flutter/material.dart';
import 'package:stateless_statefull/features/notes/notes_view_model/notes_view_model.dart';
import 'package:stateless_statefull/utils/widgets/cancel_button.dart';

import '../../../utils/constants/constants.dart';


FloatingActionButton notesFloatingbutton(
    BuildContext context,NoteViewModel viewModel) {
  return FloatingActionButton(
    onPressed: () => showDialog(
      context: context,
      builder: (context) {
        TextEditingController titleEditingController = TextEditingController();
        TextEditingController bodyEditingController = TextEditingController();
        return AlertDialog(
          content: SingleChildScrollView(
              child: Column(
            children: [
              TextField(
                controller: titleEditingController,
                decoration: const InputDecoration(
                  hintText: addNoteTitle,
                ),
              ),
              TextField(
                controller: bodyEditingController,
                decoration: const InputDecoration(
                  hintText: addNoteBody,
                ),
              ),
            ],
          )),
          actions: [
            TextButton(
                onPressed: () {
                  if (titleEditingController.text.isNotEmpty &&
                      bodyEditingController.text.isNotEmpty) {
                    viewModel.addNotes(titleEditingController.text,
                        bodyEditingController.text);
                    titleEditingController.clear();
                    bodyEditingController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save")),
            const CancellBttn(),
          ],
        );
      },
    ),
    child: const Icon(Icons.add),
  );
}
