import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/views/widgets/editdialogue.dart';
import '../view_models/todo_view_model.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              hintText: 'Add Todo',
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                viewModel.addTodo(value);
                _textEditingController.clear();
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.todos.length,
              itemBuilder: (context, index) {
                final todo = viewModel.todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (value) => viewModel.toggleTodoStatus(index),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return EditDialogue(
                        index: index,
                        value: todo.title,
                      );
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => viewModel.deleteTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
