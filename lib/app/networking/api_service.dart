import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/response/favorite_id.dart';
import 'package:flutter_app/app/models/response/food_recipe_detail.dart';
import 'package:flutter_app/app/models/response/food_recipe_favorite.dart';
import 'package:flutter_app/app/models/response/food_recipe_list.dart';
import 'package:flutter_app/app/models/response/food_recipe_search_result.dart';
import 'package:flutter_app/app/models/response/profile_me.dart';
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

  Future<List<FoodRecipeList>?> getAllFoodRecipes(
      int page, int pageSize) async {
    return await network<List<FoodRecipeList>>(
        request: (request) => request.get(
              "/food-recipes?fields[0]=name&sort=name&fields[1]=age&fields[2]=nutritions&populate[img][fields][1]=url&sort=name&pagination[page]=$page&pagination[pageSize]=$pageSize",
            ));
  }

  Future<FoodRecipeDetail?> getRecipeDetail(int id) async {
    return await network<FoodRecipeDetail>(
      request: (request) => request.get(
        "/food-recipes/$id?populate[img][fields][0]=url",
      ),
    );
  }

  Future<List<FoodRecipeSearchResult>?> searchRecipes(String query) async {
    return await network(
        request: (request) => request.get(
            '/food-recipes?fields[0]=name&sort=name&fields[1]=age&populate[img][fields][1]=url&filters[\$or][0][name][\$containsi]=$query&filters[\$or][1][age][\$containsi]=$query'));
  }

  Future<List<FoodRecipeFavorite>?> getFavoriteRecipe() async {
    return await network(request: (request) => request.get('/favorite-recipe'));
  }

  Future<FavoriteId?> addFavoriteRecipe(int userId, int recipeId) async {
    return await network(
        request: (request) => request.post(
              '/favorites',
              data: {
                "data": {
                  "user": userId,
                  "recipes": recipeId,
                }
              },
            ));
  }

  Future<FavoriteId?> removeFavoriteRecipe(int favoriteId) async {
    return await network(
        request: (request) => request.delete('/favorites/$favoriteId'));
  }

  Future<ProfileMe?> getProfileMe() async {
    return await network(request: (request) => request.get('/users/me'));
  }

  Future<User?> changePassword(String oldPassword, String newPassword) async {
    return await network(
      request: (request) => request.post(
        '/auth/change-password',
        data: {
          'currentPassword': oldPassword,
          'password': newPassword,
          'passwordConfirmation': newPassword,
        },
      ),
    );
  }

  Future<void> requestResetPasswod(String email) async {
    return await network(
      request: (request) => request.post(
        '/auth/forgot-password',
        data: {'email': email},
      ),
      handleSuccess: (Response response) {
        // response - Dio Response object
        dynamic data = response.data;
        if (data["ok"] == true) {
          return true;
        }
        return false;
      },
    );
  }

  Future<void> registerUser(
      String firstNameController,
      String lastNameController,
      String emailController,
      String passwordController) async {
    return await network(
      request: (request) => request.post(
        '/auth/local/register',
        data: {
          "firstName": firstNameController,
          "lastName": lastNameController,
          "username": emailController,
          "password": passwordController,
          "email": emailController
        },
      ),
      handleSuccess: (Response response) {
        if (response.statusCode == 200) {
          return true;
        }
        return false;
      },
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
