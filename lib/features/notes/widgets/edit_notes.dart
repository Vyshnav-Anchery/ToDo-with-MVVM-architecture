import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_statefull/features/notes/notes_view_model/notes_view_model.dart';

import '../../../utils/constants/constants.dart';
import '../../../utils/widgets/cancel_button.dart';
import '../model/notes_model.dart';

Future<dynamic> editNotes(BuildContext context, int index) {
  final viewModel = Provider.of<NoteViewModel>(context, listen: false);
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editbodyController = TextEditingController();
  final note = viewModel.notes[index];

  return showDialog(
    context: context,
    builder: (context) {
      editTitleController.text = note.noteTitle!;
      editbodyController.text = note.notebody!;
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: editTitleController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text(addNoteTitle)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: null,
                controller: editbodyController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text(addNoteBody)),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              var values = NotesModel(
                  noteTitle: editTitleController.text,
                  notebody: editbodyController.text);
              viewModel.editNotes(index, values);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: saveText,
          ),
          const CancellBttn(),
        ],
      );
    },
  );
}
