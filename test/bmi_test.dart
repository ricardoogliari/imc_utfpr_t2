import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/bmi_controller.dart';
import 'package:myapp/config.dart';

void main() {
  late BMIController controller;

  setUp(() {
    controller = BMIController();
  });

  group("Test start and all levels of bmi logic", () {
    test("value should start at 0", () {
      expect(controller.bmi, results[0]);
    });

    test("value should be bmi level 1", () {
      controller.calculateBMI(weight: 55.0, height: 1.79);

      expect(controller.bmi, results[1]);
    });

    test("value should be bmi level 2", () {
      controller.calculateBMI(weight: 68.0, height: 1.79);

      expect(controller.bmi, results[2]);
    });

    test("value should be bmi level 3", () {
      controller.calculateBMI(weight: 89.0, height: 1.79);

      expect(controller.bmi, results[3]);
    });

    test("value should be bmi level 4", () {
      controller.calculateBMI(weight: 98.0, height: 1.79);

      expect(controller.bmi, results[4]);
    });

    test("value should be bmi level 5", () {
      controller.calculateBMI(weight: 98.0, height: 1.52);

      expect(controller.bmi, results[5]);
    });
  });

  group('Test input validation logic', (){
    test("weight should be greater than zero", () {
      expect(controller.validateWeight("0"), "Weight must be greater than zero!");
      expect(controller.validateWeight("-1"), "Weight must be greater than zero!");
      expect(controller.validateWeight("a"), "Please, enter a valid weight!");
      expect(controller.validateWeight(""), "Please, enter a valid weight!");
    });

    test("height should be greater than zero", () {
      expect(controller.validateHeight("0"), "Height must be greater than zero!");
      expect(controller.validateHeight("-1"), "Height must be greater than zero!");
      expect(controller.validateHeight("a"), "Please, enter a valid height!");
      expect(controller.validateHeight(""), "Please, enter a valid height!");
    });
  });
}
