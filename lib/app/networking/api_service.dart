import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/response/food_recipe_detail.dart';
import 'package:flutter_app/app/models/response/food_recipe_list.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/dio/interceptors/bearer_auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ApiService extends BaseApiService {
  ApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  final interceptors = {
    if (getEnv('APP_DEBUG') == true) PrettyDioLogger: PrettyDioLogger(),
    BearerAuthInterceptor: BearerAuthInterceptor()
  };

  Future<User?> fetchUser(String identifier, String password) async {
    return await network<User>(
      request: (request) => request.post("/auth/local",
          data: {"identifier": identifier, "password": password}),
    );
  }

  Future<List<FoodRecipeList>?> getAllFoodRecipes() async {
    return await network<List<FoodRecipeList>>(
        request: (request) => request.get(
              "/food-recipes?fields[0]=name&sort=name&fields[1]=age&fields[2]=nutritions&populate[img][fields][1]=url&sort=name",
            ));
  }

  Future<FoodRecipeDetail?> getRecipeDetail(int id) async {
    return await network<FoodRecipeDetail>(
      request: (request) => request.get(
        "/food-recipes/$id?populate[img][fields][0]=url",
      ),
    );
  }

  displayError(DioException dioException, BuildContext context) {
    if (dioException.response != null) {
      showToastNotification(
        context,
        title: dioException.response?.data['error']['name'],
        description: dioException.response?.data['error']['message'],
        style: ToastNotificationStyleType.DANGER,
      );
    } else {
      showToastNotification(
        context,
        title: 'Oops!',
        description: dioException.message.toString(),
        style: ToastNotificationStyleType.DANGER,
      );
    }

    // or display the error however you want
  }
}
