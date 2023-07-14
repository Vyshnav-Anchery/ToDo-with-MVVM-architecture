import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../view_models/todo_view_model.dart';

class NotesScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: notesAppBarTitle,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: addStringText,
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    viewModel.addTodo(value);
                    _textEditingController.clear();
                  }
                },
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final todo = viewModel.todos[index];
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(todo.title),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Body Content'),
                        ),
                      ],
                    ),
                  );
                },
                childCount: viewModel.todos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
