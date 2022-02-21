import 'dart:developer';

import 'package:flutter_book/datasource/repository/base_repository.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

abstract class BaseModel<T extends TableBase> extends Model {
  List<T> entityList;
  T? entityBeingEdited;
  String? chosenDate;
  DateTime? latestLoaded;
  final BaseRepository<T> _repository;

  BaseModel(this._repository) : entityList = List<T>.empty() {
    loadList();
  }

  postChosenDate(String? value) {
    chosenDate = value;
    notifyListeners();
  }

  postEntityList(value) {
    entityList = value;
    notifyListeners();
  }

  postEntityBeingEdited(T entity) async {
    entityBeingEdited = entity;
    await entityBeingEdited!.saveOrThrow();
    await loadList();
  }

  saveAll(List<T> entities) {
    for (var element in entities) {
      element.saveOrThrow();
    }
  }

  delete(T entity) async {
    await entity.delete();
    await loadList();
  }

  loadList() async {
    // Validação para não entrar em loop.
    if (latestLoaded == null ||
        DateTime.now().difference(latestLoaded!) > const Duration(seconds: 1)) {
      latestLoaded = DateTime.now();
      var list = await _repository.findAll();
      postEntityList(list);
    }
  }
}