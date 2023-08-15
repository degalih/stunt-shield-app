import 'package:stunt_shield_app/app/models/article.dart';
import 'package:stunt_shield_app/app/models/poster.dart';
import 'package:stunt_shield_app/app/models/response/favorite_id.dart';
import 'package:stunt_shield_app/app/models/response/food_recipe_favorite.dart';
import 'package:stunt_shield_app/app/models/response/profile_me.dart';

import '../app/models/response/food_recipe_search_result.dart';
import '../app/models/response/food_recipe_detail.dart';
import 'package:stunt_shield_app/app/models/response/food_recipe_list.dart';
import 'package:stunt_shield_app/app/models/user.dart';
import 'package:stunt_shield_app/app/networking/dio/base_api_service.dart';
import '/app/networking/api_service.dart';

final Map<Type, dynamic> modelDecoders = {
  User: (data) => User.fromJson(data),
  FoodRecipeDetail: (data) => FoodRecipeDetail.fromJson(data),
  FavoriteId: (data) => FavoriteId.fromJson(data),
  ProfileMe: (data) => ProfileMe.fromJson(data),
  List<FoodRecipeList>: (data) => List<FoodRecipeList>.from(
      data["data"].map((x) => FoodRecipeList.fromJson(x))),
  List<FoodRecipeSearchResult>: (data) => List<FoodRecipeSearchResult>.from(
      data["data"].map((x) => FoodRecipeSearchResult.fromJson(x))),
  List<FoodRecipeFavorite>: (data) => List<FoodRecipeFavorite>.from(
      data["data"].map((x) => FoodRecipeFavorite.fromJson(x))),
  List<Poster>: (data) =>
      List<Poster>.from(data["data"].map((x) => Poster.fromJson(x))),
  List<Article>: (data) =>
      List<Article>.from(data["data"].map((x) => Article.fromJson(x))),

  // List<Infographic>: (data) =>
  //     List.from(data).map((json) => Infographic.fromJson(json)).toList(),
};

final Map<Type, BaseApiService> apiDecoders = {
  ApiService: ApiService(),
};
