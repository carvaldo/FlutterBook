import 'package:flutter_book/datasource/local/database.dart';
import 'package:flutter_book/datasource/repository/base_repository.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

class NotesRepository implements BaseRepository<Note> {

  final _note = Note();

  @override
  Future<List<Note>> findAll() =>  _note.select().toList();

  @override
  Future<Note?> get(int id) => _note.select().id.equals(id).toSingle();

  @override
  Future<BoolResult> delete(int id) => _note.select().id.equals(id).delete();

  @override
  Future<int?> save(Note entity) => entity.saveOrThrow();
}