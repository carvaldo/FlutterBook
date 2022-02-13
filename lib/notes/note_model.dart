import 'package:flutter/material.dart';
import 'package:flutter_book/base_model.dart';
import 'package:flutter_book/base_stack.dart';
import 'package:flutter_book/datasource/local/database.dart';
import 'package:flutter_book/notes/note_entry.dart';
import 'package:flutter_book/notes/notes_list.dart';

class NoteModel extends BaseModel<Note> with BaseStack {

  NoteModel._({index = 0}) {
    this.index = index;
  }

  static NoteModel? _model;

  static NoteModel getInstance({index = 0}) {
    NoteModel._model ??= NoteModel._(index: index);
    return NoteModel._model!;
  }

  @override
  List<Widget> getChildren() => const [ NotesList(), NoteEntry() ];

}