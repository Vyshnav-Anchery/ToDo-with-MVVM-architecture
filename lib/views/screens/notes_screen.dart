import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/views/widgets/appbar_ref.dart';

import '../../utils/constants.dart';
import '../../view_models/notes_view_model.dart';
import '../widgets/Notes/popup_notes.dart';
import '../widgets/Notes/floating_notes_add.dart';
import '../widgets/toggle_theme.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesviewModel = Provider.of<NoteViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: notesAppBarTitle,
          actions: [
            themeToggle(context),
          ],
        ),
        floatingActionButton: notesFloatingbutton(context, notesviewModel),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final note = notesviewModel.notes[index];
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
                },
                childCount: notesviewModel.notes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
