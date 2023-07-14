import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../view_models/todo_view_model.dart';
import '../widgets/Notes/popupNotes.dart';
import '../widgets/floating_notes_add.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

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
                          child: ListTile(
                            title: Text(
                              note.noteTitle!,
                              style: titleStyle,
                            ),
                            subtitle: Text(
                              note.notebody!,
                              style: bodyStyle,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        showNotesinPopup(
                          context,
                          padding,
                          index,
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
