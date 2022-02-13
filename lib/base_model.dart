import 'package:flutter_book/datasource/repository/base_repository.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

abstract class BaseModel<T extends TableBase> extends Model {

  List<T> _entityList = [];
  T? entityBeingEdited;
  String? _chosenDate;

  /* Seleção de data não é lógicamente aplicável em todas as entidades.
   * Logo, não faz sentido que seja disponibilizada em uma classe base.
   * TODO: Mover atributo para casos que se faça necessário.
   */
  set chosenDate(String? value) {
    _chosenDate = value;
    notifyListeners();
  }

  set entityList(value) {
    _entityList = value;
    notifyListeners();
  }

  List<T> get entityList => _entityList;

  String? get chosenDate => _chosenDate;
}