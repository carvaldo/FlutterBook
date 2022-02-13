import 'package:flutter/cupertino.dart';

abstract class BaseStack {
  int index = 0;

  List<Widget> getChildren();
}