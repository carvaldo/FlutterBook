import 'package:flutter/material.dart';
import 'package:flutter_book/notes/note_model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../extensions/widget_extension.dart';

class NoteEntryWidget extends StatelessWidget{

  final _model = NoteModel.getInstance();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _contentEditingController = TextEditingController();
  final TextEditingController _titleEditingController = TextEditingController();

  NoteEntryWidget({Key? key}) : super(key: key) {
    _init();
  }

  @override
  Widget build(BuildContext context) {
    if (_model.entityBeingEdited?.title != null && _model.entityBeingEdited!.title!.isNotEmpty) {
      _titleEditingController.text = _model.entityBeingEdited!.title!;
    }
    if (_model.entityBeingEdited?.content != null && _model.entityBeingEdited!.content!.isNotEmpty) {
      _contentEditingController.text = _model.entityBeingEdited!.content!;
    }
    return ScopedModel(model: _model, child: ScopedModelDescendant(
      builder: (BuildContext inContext, Widget? child, NoteModel inModel) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(children: [
              ElevatedButton(onPressed: () {
                _save();
                _back(inContext);
              }, child: const Text("Salvar")),
              const Spacer(),
              ElevatedButton(onPressed: () => { _back(inContext) }, child: const Text("Cancelar"))
            ],),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.title),
                  title: TextFormField(
                    controller: _titleEditingController,
                    decoration: const InputDecoration(labelText: "Título"),
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return "Informe um título.";
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.title),
                  title: TextFormField(
                    controller: _contentEditingController,
                    decoration: const InputDecoration(labelText: "Conteúdo"),
                    minLines: 5,
                    maxLines: 15,
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return "Informe o conteúdo.";
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }

  _init() {
    _titleEditingController.addListener(() {
      _model.entityBeingEdited?.title = _titleEditingController.text;
    });
    _contentEditingController.addListener(() {
      _model.entityBeingEdited?.content = _contentEditingController.text;
    });
  }

  _save() {
    if (_formKey.currentState!.validate()) {
      var entity = _model.entityBeingEdited!
        ..title = _titleEditingController.text
        ..content = _contentEditingController.text;
      _model.postEntityBeingEdited(entity);
      _model.index = _model.index - 1;
    }
  }

  _back(BuildContext inContext) {
    dismissKeyboard(inContext);
    _model.index = 0;
  }
}