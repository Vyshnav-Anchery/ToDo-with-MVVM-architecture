import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/utils/constants.dart';
import 'package:stateless_statefull/views/widgets/edit_dialogue.dart';
import '../../view_models/todo_view_model.dart';
import '../widgets/floating_add_button.dart';

class TodoScreen extends StatelessWidget {

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: appBarTitle,
        ),
        floatingActionButton: addTodo(context, viewModel),
        body: Column(
          children: [
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
        // bottomNavigationBar: bottomNavigator(viewModel),
      ),
    );
  }
}
