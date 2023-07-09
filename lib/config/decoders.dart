import 'package:flutter_app/app/models/food_recipe.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/dio/base_api_service.dart';
import '/app/networking/api_service.dart';

final Map<Type, dynamic> modelDecoders = {
  User: (data) => User.fromJson(data),
  FoodRecipe: (data) => FoodRecipe.fromJson(data),
};

final Map<Type, BaseApiService> apiDecoders = {
  ApiService: ApiService(),
};
