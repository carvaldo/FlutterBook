import 'package:flutter_book/base_stack.dart';
import 'package:flutter_book/notes/note_entry.dart';
import 'package:flutter_book/notes/notes_list.dart';

class NotesStack extends BaseStack{
  NotesStack() : super(children: const [NotesList(), NoteEntry()]);
}