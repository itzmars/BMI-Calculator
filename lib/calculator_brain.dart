import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height}) {
    _bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;

  late double _bmi;

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return "You have a  higher than normal body weight, you should exercice more!";
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight, good job";
    } else {
      return "You have a lowe than normal body weight, you should eat more !";
    }
  }
}
