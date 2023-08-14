import 'package:flutter/material.dart';
import '../../../utils/constants/constants.dart';
import '../todo_view_model/todo_view_model.dart';

FloatingActionButton addTodo(BuildContext context, TodoViewModel viewModel) {
  final TextEditingController textEditingController = TextEditingController();
  addItem() {
    if (textEditingController.text.isNotEmpty) {
      viewModel.addTodo(textEditingController.text);
      textEditingController.clear();
      Navigator.pop(context);
    }
  }

  return FloatingActionButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: addStringText,
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: addItem,
                child: const Text("Save"),
              ),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
            ],
          );
        },
      );
    },
    child: const Icon(Icons.add),
  );
}
