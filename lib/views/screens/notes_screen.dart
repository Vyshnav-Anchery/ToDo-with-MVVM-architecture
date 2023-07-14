import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/models/todo_model.dart';
import 'package:stateless_statefull/views/widgets/cancellbutton.dart';

import '../../utils/constants.dart';
import '../../view_models/todo_view_model.dart';
import '../widgets/floating_notes_add.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);
    TextEditingController editTitleController = TextEditingController();
    TextEditingController editbodyController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: notesAppBarTitle,
        ),
        floatingActionButton: notesFloatingbutton(context, viewModel),
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
                    var size = MediaQuery.sizeOf(context);
                    var padding = size.width * .05;
                    return InkWell(
                      child: Card(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "${note.noteTitle}",
                                  style: titleStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: padding,
                                    left: padding,
                                    right: padding,
                                    bottom: padding),
                                child: Text(
                                  "${note.notebody}",
                                  style: bodyStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "${note.noteTitle}",
                                        style: titleStyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: padding,
                                          left: padding,
                                          right: padding,
                                          bottom: padding),
                                      child: Text("${note.notebody}"),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          editTitleController.text =
                                              "${note.noteTitle}";
                                          editbodyController.text =
                                              note.notebody!;
                                          return AlertDialog(
                                            content: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    controller:
                                                        editTitleController,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  TextField(
                                                    maxLines: null,
                                                    controller:
                                                        editbodyController,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  var values = NotesModel(
                                                      noteTitle:
                                                          editTitleController
                                                              .text,
                                                      notebody:
                                                          editbodyController
                                                              .text);
                                                  viewModel.editNotes(
                                                      index, values);
                                                  Navigator.popUntil(context,
                                                      (route) => route.isFirst);
                                                },
                                                child: saveText,
                                              ),
                                              const CancellBttn(),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: editText),
                                const CancellBttn()
                              ],
                            );
                          },
                        );
                      },
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
