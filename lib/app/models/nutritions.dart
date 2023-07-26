import 'package:nylo_framework/nylo_framework.dart';

class Nutritions extends Model {
  String? choG;
  String? fatG;
  String? waterG;
  String? proteinG;
  String? energyKal;

  Nutritions();

  Nutritions.fromJson(dynamic data) {
    choG = data['CHO(g)'];
    fatG = data['Fat(g)'];
    waterG = data['Water(g)'];
    proteinG = data['Protein(g)'];
    energyKal = data['Energy(kal)'];
  }

  toJson() => {
        "CHO(g)": choG,
        "Fat(g)": fatG,
        "Water(g)": waterG,
        "Protein(g)": proteinG,
        "Energy(kal)": energyKal,
      };
}
