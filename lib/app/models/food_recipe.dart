import 'package:nylo_framework/nylo_framework.dart';

class FoodRecipe extends Model {
  int? id;
  // String? email;

  FoodRecipe();

  FoodRecipe.fromJson(dynamic data) {
    id = data['data']['id'];
    // email = data['email'];
  }

  toJson() => {
        "id": id,
        // "email": email,
      };
}


// import 'dart:convert';

// FoodRecipe foodRecipeFromJson(String str) =>
//     FoodRecipe.fromJson(json.decode(str));

// String foodRecipeToJson(FoodRecipe data) => json.encode(data.toJson());

// class FoodRecipe {
//   List<Datum> data;
//   Meta meta;

//   FoodRecipe({
//     required this.data,
//     required this.meta,
//   });

//   factory FoodRecipe.fromJson(Map<String, dynamic> json) => FoodRecipe(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "meta": meta.toJson(),
//       };
// }

// class Datum {
//   int id;
//   DatumAttributes attributes;

//   Datum({
//     required this.id,
//     required this.attributes,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         attributes: DatumAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//       };
// }

// class DatumAttributes {
//   String name;
//   List<String> ingredients;
//   List<String> steps;
//   Nutritions nutritions;
//   String trivia;
//   Img img;

//   DatumAttributes({
//     required this.name,
//     required this.ingredients,
//     required this.steps,
//     required this.nutritions,
//     required this.trivia,
//     required this.img,
//   });

//   factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
//       DatumAttributes(
//         name: json["name"],
//         ingredients: List<String>.from(json["ingredients"].map((x) => x)),
//         steps: List<String>.from(json["steps"].map((x) => x)),
//         nutritions: Nutritions.fromJson(json["nutritions"]),
//         trivia: json["trivia"],
//         img: Img.fromJson(json["img"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
//         "steps": List<dynamic>.from(steps.map((x) => x)),
//         "nutritions": nutritions.toJson(),
//         "trivia": trivia,
//         "img": img.toJson(),
//       };
// }

// class Img {
//   Data data;

//   Img({
//     required this.data,
//   });

//   factory Img.fromJson(Map<String, dynamic> json) => Img(
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

// class Data {
//   int id;
//   DataAttributes attributes;

//   Data({
//     required this.id,
//     required this.attributes,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         attributes: DataAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//       };
// }

// class DataAttributes {
//   String name;
//   String url;

//   DataAttributes({
//     required this.name,
//     required this.url,
//   });

//   factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
//         name: json["name"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "url": url,
//       };
// }

// class Nutritions {
//   Ifcd ifcd;
//   Recipes recipes;

//   Nutritions({
//     required this.ifcd,
//     required this.recipes,
//   });

//   factory Nutritions.fromJson(Map<String, dynamic> json) => Nutritions(
//         ifcd: Ifcd.fromJson(json["ifcd"]),
//         recipes: Recipes.fromJson(json["recipes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "ifcd": ifcd.toJson(),
//         "recipes": recipes.toJson(),
//       };
// }

// class Ifcd {
//   String cho;
//   String fat;
//   String water;
//   String energy;
//   String protein;

//   Ifcd({
//     required this.cho,
//     required this.fat,
//     required this.water,
//     required this.energy,
//     required this.protein,
//   });

//   factory Ifcd.fromJson(Map<String, dynamic> json) => Ifcd(
//         cho: json["CHO"],
//         fat: json["Fat"],
//         water: json["Water"],
//         energy: json["Energy"],
//         protein: json["Protein"],
//       );

//   Map<String, dynamic> toJson() => {
//         "CHO": cho,
//         "Fat": fat,
//         "Water": water,
//         "Energy": energy,
//         "Protein": protein,
//       };
// }

// class Recipes {
//   String fat;
//   String energy;
//   String protein;

//   Recipes({
//     required this.fat,
//     required this.energy,
//     required this.protein,
//   });

//   factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
//         fat: json["Fat"],
//         energy: json["Energy"],
//         protein: json["Protein"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Fat": fat,
//         "Energy": energy,
//         "Protein": protein,
//       };
// }

// class Meta {
//   Pagination pagination;

//   Meta({
//     required this.pagination,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         pagination: Pagination.fromJson(json["pagination"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "pagination": pagination.toJson(),
//       };
// }

// class Pagination {
//   int page;
//   int pageSize;
//   int pageCount;
//   int total;

//   Pagination({
//     required this.page,
//     required this.pageSize,
//     required this.pageCount,
//     required this.total,
//   });

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         page: json["page"],
//         pageSize: json["pageSize"],
//         pageCount: json["pageCount"],
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "page": page,
//         "pageSize": pageSize,
//         "pageCount": pageCount,
//         "total": total,
//       };
// }
