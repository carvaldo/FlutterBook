import 'package:flutter/material.dart';
import 'package:flutter_book/base_model.dart';
import 'package:flutter_book/base_stack.dart';
import 'package:flutter_book/datasource/local/database.dart';
import 'package:flutter_book/datasource/repository/base_repository.dart';
import 'package:flutter_book/datasource/repository/note_repository.dart';
import 'package:flutter_book/notes/note_entry_widget.dart';
import 'package:flutter_book/notes/notes_list_widget.dart';

class NoteModel extends BaseModel<Note> with BaseStack {
  
  static NoteModel? _model;
  final NotesRepository _repository;

  NoteModel._(this._repository) : super(_repository);

  factory NoteModel() {
    return NoteModel._(NotesRepository());
  }

  static NoteModel getInstance({index = 0}) {
    NoteModel._model ??= NoteModel();
    return NoteModel._model!;
  }

  @override
  List<Widget> getChildren() => [ NotesListWidget(), NoteEntryWidget() ];
}