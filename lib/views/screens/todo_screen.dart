import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/utils/constants.dart';
import 'package:stateless_statefull/view_models/theme_view_model.dart';
import 'package:stateless_statefull/views/widgets/toggleTheme.dart';

import '../../view_models/todo_view_model.dart';
import '../widgets/Todo/edit_dialogue.dart';
import '../widgets/Todo/floating_add_button.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          actions: [
            themeToggle(context)
          ],
        ),
        floatingActionButton: addTodo(context, viewModel),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.todos.length,
                itemBuilder: (context, index) {
                  final todo = viewModel.todos[index];
                  return Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: themeViewModel.isDarkMode ?Colors.black54:Colors.amberAccent,
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: todo.isDone,
                        onChanged: (value) => viewModel.toggleTodoStatus(index),
                      ),
                      title: Text(
                        todo.title!,
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
                            value: todo.title!,
                          );
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => viewModel.deleteTodo(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
