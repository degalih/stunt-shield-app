import 'package:nylo_framework/nylo_framework.dart';

class FoodRecipeList extends Model {
  int? id;
  String? name;
  String? age;
  String? source;
  String? imgUrl;
  Nutritions? nutritions;
  // List<steps> steps;

  FoodRecipeList();

  FoodRecipeList.fromJson(dynamic data) {
    id = data['id'];
    name = data['attributes']['name'];
    age = data['attributes']['age'];
    source = data['attributes']['source'];
    imgUrl = data['attributes']['img']['data']['attributes']['url'];
    nutritions = Nutritions.fromJson(data['attributes']['nutritions']);
  }

  toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "source": source,
        "imgUrl": imgUrl,
      };
}

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
