import 'package:flutter/material.dart';
import 'package:flutter_book/datasource/local/database.dart';
import 'package:flutter_book/notes/note_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: NoteModel.getInstance(),
        child: ScopedModelDescendant(builder: (inContext, inChild, NoteModel inModel){
          return Scaffold(
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  inModel.entityBeingEdited = Note();
                  inModel.index = 1;
                }
            ),
          );
        })
    );
  }

}