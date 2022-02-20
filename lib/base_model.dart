import 'dart:developer';

import 'package:flutter_book/datasource/repository/base_repository.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

abstract class BaseModel<T extends TableBase> extends Model {
  List<T> _entityList;
  T? entityBeingEdited;
  String? chosenDate;
  DateTime? latestLoaded;
  final BaseRepository<T> _repository;

  BaseModel(this._repository) : _entityList = List<T>.empty();

  postChosenDate(String? value) {
    chosenDate = value;
    notifyListeners();
  }

  postEntityList(value) {
    _entityList = value;
    notifyListeners();
  }

  postEntityBeingEdited(T? entity) {
    entityBeingEdited = entity;
    notifyListeners();
  }


  List<T> get entityList {
    _loadList();
    return _entityList;
  }

  set entityList(List<T> value) {
    _entityList = value;
  }

  saveAll(List<T> entities) {
    for (var element in entities) {
      element.saveOrThrow();
    }
  }

  _loadList() async {
    if (latestLoaded == null || DateTime.now().difference(latestLoaded!) > const Duration(seconds: 15)) {
      latestLoaded = DateTime.now();
      log("_loadList");
      var list = await _repository.findAll();
      postEntityList(list);
    }
  }
}