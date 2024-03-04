import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider with ChangeNotifier {
  final compController = TextEditingController();

  setValue(String value) {
    String str = compController.text;

    switch (value) {
      case "C":
        compController.clear();
        break;
      case "AC":
        compController.text = str.substring(0, str.length - 1);
        break;
      case "X":
        compController.text += "*";
        break;
      case "=":
        compute();
        break;
      default:
        compController.text += value;
    }
    //for having the cusor always at the end
    compController.selection = TextSelection.fromPosition(
      TextPosition(offset: compController.text.length),
    );
  }

  compute() {
    String text = compController.text;
    compController.text = text.interpret().toString();
    //interpret executes the text expression, return dynamic value
  }

  @override
  void dispose() {
    super.dispose();
    compController.dispose();
  }
}
