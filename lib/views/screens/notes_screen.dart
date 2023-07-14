import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../view_models/todo_view_model.dart';

class NotesScreen extends StatelessWidget {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _bodyEditingController = TextEditingController();

  NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: notesAppBarTitle,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SingleChildScrollView(
                    child: Column(
                  children: [
                    TextField(
                      controller: _titleEditingController,
                      decoration: const InputDecoration(
                        hintText: addStringText,
                      ),
                    ),
                    TextField(
                      controller: _bodyEditingController,
                      decoration: const InputDecoration(
                        hintText: addStringText,
                      ),
                    ),
                  ],
                )),
                actions: [
                  TextButton(
                      onPressed: () {
                        if (_titleEditingController.text.isNotEmpty &&
                            _bodyEditingController.text.isNotEmpty) {
                          viewModel.addNotes(_titleEditingController.text,
                              _bodyEditingController.text);
                          _titleEditingController.clear();
                          _bodyEditingController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Save"))
                ],
              );
            },
          ),
          child: Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final note = viewModel.notes[index];
                  if (note.noteTitle != null && note.notebody != null) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("${note.noteTitle}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("${note.notebody}"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return null;
                  }
                },
                childCount: viewModel.notes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
