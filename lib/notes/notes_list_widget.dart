import 'package:flutter/material.dart';
import 'package:flutter_book/datasource/local/database.dart';
import 'package:flutter_book/notes/note_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';

class NotesListWidget extends StatelessWidget {
  NotesListWidget({Key? key}) : super(key: key);

  final NoteModel _model = NoteModel.getInstance();

  @override
  Widget build(BuildContext context) {

    return ScopedModel(
        model: NoteModel.getInstance(),
        child: ScopedModelDescendant(builder: (inContext, inChild, NoteModel inModel){
          return Scaffold(
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => _openEdit(inModel)
            ),
            body: ListView.builder(
                itemCount: inModel.entityList.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (inContext, i) {
                  var note = inModel.entityList[i];
                  return Slidable(
                    child: ListTile(
                        title: Text(note.title!),
                        subtitle: Text(note.content!),
                        onTap: () => _showDetail(note)
                    ),
                    startActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: .25,
                      children: [
                        SlidableAction(
                            backgroundColor: Colors.red.shade700,
                            icon: Icons.delete,
                            onPressed: (inContext) => _deleteNote(note)
                        )
                      ],
                    ),
                  );
                }),
          );
        })
    );
  }

  _openEdit(NoteModel inModel) {
    inModel.entityBeingEdited = Note();
    inModel.index = 1;
  }

  _deleteNote(Note note) {
    _model.delete(note);
  }

  _showDetail(Note note) {
    _model.entityBeingEdited = note;
    _model.index = 1;
  }
}