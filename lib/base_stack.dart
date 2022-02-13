import 'package:flutter/cupertino.dart';
import 'package:flutter_book/base_model.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

mixin BaseStack<T extends TableBase> on BaseModel<T> {
  int _index = 0;

  List<Widget> getChildren();

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
}