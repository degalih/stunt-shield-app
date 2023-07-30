import 'package:nylo_framework/nylo_framework.dart';

class Nutritions extends Model {
  String? choG;
  String? fatG;
  String? proteinG;
  String? energyKal;

  Nutritions();

  Nutritions.fromJson(dynamic data) {
    choG = data['CHO(g)'];
    fatG = data['Fat(g)'];
    proteinG = data['Protein(g)'];
    energyKal = data['Energy(Kal)'];
  }

  toJson() => {
        "CHO(g)": choG,
        "Fat(g)": fatG,
        "Protein(g)": proteinG,
        "Energy(Kal)": energyKal,
      };
}
