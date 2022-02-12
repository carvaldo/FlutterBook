import 'package:flutter_book/notes/notes_db_worker.dart';
import 'package:scoped_model/scoped_model.dart';

class BaseModel<T> extends Model {
  List<T> _entityList = [];
  T? _entityBeingEdited;
  String? _chosenDate;

  set chosenDate(String? value) {
    _chosenDate = value;
    notifyListeners();
  }

  set entityList(value) {
    _entityList = value;
    notifyListeners();
  }

  get entityList => _entityList;

  T? get entityBeingEdited => _entityBeingEdited;

  String? get chosenDate => _chosenDate;

  loadData(String inEntityType, dynamic inDataBase) async {
    _entityList = await inDataBase.getAll();
  }
}