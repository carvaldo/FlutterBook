import 'package:flutter/material.dart';
import 'package:flutter_book/notes/note_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NoteModel>(
        model: NoteModel.getInstance(),
        child: ScopedModelDescendant<NoteModel>(builder: (inContext, child, model) =>
            IndexedStack(
                index: model.index,
                children: model.getChildren()
            )
        )
    );
  }
}
