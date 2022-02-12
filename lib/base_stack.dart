import 'package:flutter/cupertino.dart';

abstract class BaseStack {

  BaseStack({required this.children, this.currentStackIndex = 0}) ;

  List<Widget> children;
  int currentStackIndex;
}