import '../app/models/response/food_recipe_search_result.dart';
import '../app/models/response/food_recipe_detail.dart';
import 'package:flutter_app/app/models/response/food_recipe_list.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/dio/base_api_service.dart';
import '/app/networking/api_service.dart';

final Map<Type, dynamic> modelDecoders = {
  User: (data) => User.fromJson(data),
  // FoodRecipe: (data) => FoodRecipe.fromJson(data)
  List<FoodRecipeList>: (data) => List<FoodRecipeList>.from(
      data["data"].map((x) => FoodRecipeList.fromJson(x))),

  // List<FoodRecipeDetail>: (data) =>
  //     List.from(data).map((json) => FoodRecipeDetail.fromJson(json)).toList(),

  FoodRecipeDetail: (data) => FoodRecipeDetail.fromJson(data),

  List<FoodRecipeSearchResult>: (data) => List<FoodRecipeSearchResult>.from(
      data["data"].map((x) => FoodRecipeSearchResult.fromJson(x))),

  // FoodRecipeSearchResult: (data) => FoodRecipeSearchResult.fromJson(data),
};

final Map<Type, BaseApiService> apiDecoders = {
  ApiService: ApiService(),
};
