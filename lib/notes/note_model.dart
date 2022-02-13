import 'package:flutter/material.dart';
import 'package:flutter_book/base_model.dart';
import 'package:flutter_book/base_stack.dart';
import 'package:flutter_book/datasource/local/database.dart';
import 'package:flutter_book/notes/note_entry.dart';
import 'package:flutter_book/notes/notes_list.dart';

class NoteModel extends BaseModel<Note> with BaseStack {

  NoteModel({index = 0}) {
    this.index = index;
  }

  @override
  List<Widget> getChildren() => const [ NotesList(), NoteEntry() ];

}