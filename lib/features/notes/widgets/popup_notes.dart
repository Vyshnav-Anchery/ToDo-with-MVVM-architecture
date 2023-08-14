import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/constants.dart';
import '../notes_view_model/notes_view_model.dart';
import '../../../utils/widgets/cancel_button.dart';
import 'edit_notes.dart';

Future<dynamic> showNotesinPopup(
    BuildContext context, double padding, int index) {
  final viewModel = Provider.of<NoteViewModel>(context, listen: false);
  final note = viewModel.notes[index];

  delete() {
    viewModel.deleteNotes(index);
    Navigator.pop(context);
  }

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListTile(
            title: Text(
              note.noteTitle!,
              style: titleStyle,
            ),
            subtitle: Text(note.notebody!),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              editNotes(context, index);
            },
            child: editText,
          ),
          TextButton(
            onPressed: delete,
            child: deleteText,
          ),
          const CancellBttn()
        ],
      );
    },
  );
}
