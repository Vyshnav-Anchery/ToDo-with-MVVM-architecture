import 'package:flutter/material.dart';
import 'package:stateless_statefull/views/widgets/cancellbutton.dart';

import '../../utils/constants.dart';
import '../../view_models/todo_view_model.dart';

FloatingActionButton notesFloatingbutton(
    BuildContext context, TodoViewModel viewModel) {
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
                  hintText: addStringText,
                ),
              ),
              TextField(
                controller: bodyEditingController,
                decoration: const InputDecoration(
                  hintText: addStringText,
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
