import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/utils/constsants/constants.dart';

import '../../../models/todo_model.dart';
import '../../../features/todo/todo_model/todo_view_model.dart';


class EditDialogue extends StatelessWidget {
  final String value;
  final int index;
  const EditDialogue({super.key, required this.value, required this.index});

  @override
  Widget build(BuildContext context) {
    TextEditingController editController = TextEditingController();

    editController.text = value;

    final viewModel = Provider.of<TodoViewModel>(context);
    editValue() {
      viewModel.editTodo(
        index,
        Todo(title: editController.text),
      );
      Navigator.pop(context);
    }

    return AlertDialog(
      content: TextFormField(
        controller: editController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: editValue,
          child: editText,
        ),
      ],
    );
  }
}
