import 'package:flutter/widgets.dart';
import 'package:myapp/config.dart';

class BMIController extends ChangeNotifier {
  String _bmi = results[0];
  String get bmi => _bmi;

  void calculateBMI({required double weight, required double height}) {
    final bmi = weight / (height * height);

    if (bmi < 18.5) {
      _bmi = results[1];
    } else if (bmi < 24.9) {
      _bmi = results[2];
    } else if (bmi < 29.9) {
      _bmi = results[3];
    } else if (bmi < 34.9) {
      _bmi = results[4];
    } else {
      _bmi = results[5];
    }

    notifyListeners();
  }

  String? validateWeight(String? value) {
    final weightStr = value ?? '';
    if (double.tryParse(weightStr) == null) {
      return "Please, enter a valid weight!";
    } else if (double.parse(weightStr) <= 0) {
      return "Weight must be greater than zero!";
    } else if (double.parse(weightStr) > 200) {
      return "Weight must be less than 200!";
    } else {
      return null;
    }
  }

  String? validateHeight(String? value) {
    final heightStr = value ?? '';
    if (double.tryParse(heightStr) == null) {
      return "Please, enter a valid height!";
    } else if (double.parse(heightStr) <= 0) {
      return "Height must be greater than zero!";
    } else if (double.parse(heightStr) > 200) {
      return "Height must be less than 200!";
    } else {
      return null;
    }
  }
}
