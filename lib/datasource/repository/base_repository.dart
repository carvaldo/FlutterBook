import 'package:sqfentity_gen/sqfentity_gen.dart';

abstract class BaseRepository<T extends TableBase> {

  Future<T?> get(int id);

  Future<List<T>> findAll();

  Future<BoolResult> delete(int id);
}