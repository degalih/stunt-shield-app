import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class NutritionCalculator extends StatefulWidget {
  NutritionCalculator({Key? key}) : super(key: key);

  @override
  _NutritionCalculatorState createState() => _NutritionCalculatorState();
}

class _NutritionCalculatorState extends NyState<NutritionCalculator> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ini adalah halaman kalkulator'),
    );
  }
}
