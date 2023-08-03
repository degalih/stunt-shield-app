import 'package:flutter/material.dart';
import 'package:flutter_app/app/utils/nutritions_status.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';

Future<dynamic> NutritionResult(
  BuildContext context,
  NutritionStatus result,
  Color bgColor,
  Color textColor,
  Color cardColor,
  Color infoColor,
) {
  return showModalBottomSheet(
    backgroundColor: bgColor,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(64),
        topRight: Radius.circular(64),
      ),
    ),
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Icon(Icons.replay_outlined),
                //   style: ElevatedButton.styleFrom(
                //       shape: CircleBorder(),
                //       padding: EdgeInsets.all(16),
                //       backgroundColor: ThemeColor.get(context).grey600),
                // ),
                SizedBox(height: 16.0),
                Text(
                  'Status Gizi Balita adalah',
                  style: defaultTextTheme.bodyMedium!.copyWith(
                    color: textColor,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  result.status,
                  style: defaultTextTheme.displayMedium!.copyWith(
                    color: textColor,
                  ),
                ),
                SizedBox(height: 16.0),
                result.status == 'Tinggi'
                    ? Text(
                        '${result.description}',
                        style: defaultTextTheme.bodyMedium!.copyWith(
                          color: textColor,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        '${result.description} Rekomendasi tinggi badan menurut umur adalah ${result.heightRecommendation} cm',
                        style: defaultTextTheme.bodyMedium!.copyWith(
                          color: textColor,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),

                SizedBox(height: 16.0),
                Card(
                  color: cardColor,
                  child: ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: infoColor,
                    ),
                    title: Text(
                        'Dihitung berdasarkan Panjang Badan atau Tinggi Badan menurut Umur (PB/U atau TB/U anak usia 0 – 60 bulan) Tabel Standar Baku Antropometri Kementerian Kesehatan RI.',
                        softWrap: true,
                        style: defaultTextTheme.labelSmall!.copyWith(
                          color: infoColor,
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    },
  );
}
