import 'package:flutter_app/app/models/food_recipe_list.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/dio/base_api_service.dart';
import '/app/networking/api_service.dart';

final Map<Type, dynamic> modelDecoders = {
  User: (data) => User.fromJson(data),
  // FoodRecipe: (data) => FoodRecipe.fromJson(data)
  List<FoodRecipeList>: (data) => List<FoodRecipeList>.from(
      data["data"].map((x) => FoodRecipeList.fromJson(x))),
};

final Map<Type, BaseApiService> apiDecoders = {
  ApiService: ApiService(),
};
