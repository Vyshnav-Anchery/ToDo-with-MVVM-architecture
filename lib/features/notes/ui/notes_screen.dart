import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/utils/widgets/appbar_ref.dart';

import '../../../utils/constants/constants.dart';
import '../notes_model/notes_view_model.dart';
import '../widgets/popup_notes.dart';
import '../widgets/floating_notes_add.dart';
import '../../../utils/widgets/toggle_theme.dart';

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
