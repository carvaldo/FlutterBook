import 'package:flutter/material.dart';
import 'package:flutter_book/notes/note.dart';
import 'package:flutter_book/notes/notes_list.dart';
import 'package:flutter_book/notes/notes_stack.dart';
import 'package:scoped_model/scoped_model.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stack = NotesStack();

    return ScopedModel<Note>(
        model: Note(),
        child: ScopedModelDescendant<Note>(builder: (inContext, child, model) =>
            IndexedStack(
                index: stack.currentStackIndex,
                children: stack.children
            )
        )
    );
  }
}
