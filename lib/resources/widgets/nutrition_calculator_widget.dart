import 'package:flutter/material.dart';
import 'package:flutter_app/app/utils/nutritions_status.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/nutrition_card_status_widget.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:nylo_framework/nylo_framework.dart';

class NutritionCalculator extends StatefulWidget {
  NutritionCalculator({Key? key}) : super(key: key);

  @override
  _NutritionCalculatorState createState() => _NutritionCalculatorState();
}

class _NutritionCalculatorState extends NyState<NutritionCalculator> {
  int selected = 0;
  String _currentGender = 'Male';
  double _currentHeight = 0;
  int _currentAge = 0;

  Widget CustomRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
          if (selected == 1) {
            _currentGender = 'Male';
          } else {
            _currentGender = 'Female';
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              text == 'Laki-Laki'
                  ? 'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178821/Stunt%20Shield%20App%20Assets/male_ksrenw.png'
                  : 'https://res.cloudinary.com/stunt-shield-cloudinary/image/upload/v1690178821/Stunt%20Shield%20App%20Assets/female_ukewuh.png',
              height: 100.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              text,
              style: defaultTextTheme.bodyMedium!.copyWith(
                color: (selected == index)
                    ? ThemeColor.get(context).green
                    : ThemeColor.get(context).black,
              ),
            ),
          ],
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 2.0,
          color: (selected == index)
              ? ThemeColor.get(context).green
              : ThemeColor.get(context).grey400,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Kalkulator Gizi Stunting',
              style: defaultTextTheme.titleLarge,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRadioButton('Laki-Laki', 1),
                CustomRadioButton('Perempuan', 2),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: ThemeColor.get(context).grey400),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Panjang/Tinggi Badan (cm)',
                    style: defaultTextTheme.bodySmall,
                  ),
                  HorizontalPicker(
                    minValue: 20,
                    maxValue: 140,
                    divisions: 120,
                    activeItemTextColor: ThemeColor.get(context).green,
                    passiveItemsTextColor: ThemeColor.get(context).grey400,
                    height: 100,
                    suffix: " cm",
                    showCursor: false,
                    onChanged: (value) {
                      _currentHeight = value;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: ThemeColor.get(context).grey400),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Umur (bulan)',
                    style: defaultTextTheme.bodySmall,
                  ),
                  SizedBox(height: 8.0),
                  NumberPicker(
                      axis: Axis.horizontal,
                      minValue: 0,
                      maxValue: 60,
                      itemHeight: 100,
                      value: _currentAge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: ThemeColor.get(context).grey400),
                      ),
                      textStyle: defaultTextTheme.displayMedium!
                          .copyWith(color: ThemeColor.get(context).grey400),
                      selectedTextStyle: defaultTextTheme.displayMedium!
                          .copyWith(color: ThemeColor.get(context).green),
                      onChanged: (value) {
                        setState(() => _currentAge = value);
                      }),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            isLoading(name: 'loadCalculatorResult')
                ? ElevatedButton.icon(
                    icon: Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 2.0,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {},
                    label: Text(
                      'Loading...',
                      style: defaultTextTheme.labelLarge,
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2.0,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      _showCalculatorResult(context);
                    },
                    child: Text(
                      'Hitung Status Gizi',
                      style: defaultTextTheme.labelLarge,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showCalculatorResult(BuildContext context) async {
    setLoading(true, name: 'loadCalculatorResult');
    await Future.delayed(Duration(seconds: 1));
    NutritionStatus result =
        NutritionStatus.calculate(_currentHeight, _currentAge, _currentGender);
    setLoading(false, name: 'loadCalculatorResult');
    switch (result.status) {
      case 'Sangat Pendek':
        return NutritionResult(
          context,
          result,
          ThemeColor.get(context).red600,
          ThemeColor.get(context).white,
          ThemeColor.get(context).red50,
          ThemeColor.get(context).red800,
        );
      case 'Pendek':
        return NutritionResult(
          context,
          result,
          ThemeColor.get(context).yellow,
          ThemeColor.get(context).black,
          ThemeColor.get(context).yellow50,
          ThemeColor.get(context).yellow800,
        );
      case 'Normal':
        return NutritionResult(
          context,
          result,
          ThemeColor.get(context).green,
          ThemeColor.get(context).white,
          ThemeColor.get(context).green50,
          ThemeColor.get(context).green800,
        );
      case 'Tinggi':
        return NutritionResult(
          context,
          result,
          ThemeColor.get(context).blue,
          ThemeColor.get(context).white,
          ThemeColor.get(context).blue50,
          ThemeColor.get(context).blue800,
        );
    }
  }
}
