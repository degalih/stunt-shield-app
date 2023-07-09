import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/food_recipe.dart';
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
    // try {
    return await network<User>(
      request: (request) => request.post("/auth/local",
          data: {"identifier": identifier, "password": password}),
    );
    // } on DioException catch (e) {
    //   if (e.response != null) {
    //     print(e.response!.data);
    //     print(e.response!.headers);
    //     print(e.response!.requestOptions);
    //   } else {
    //     // Something happened in setting up or sending the request that triggered an Error
    //     print(e.requestOptions);
    //     print(e.message);
    //   }
    // }
    // return null;
  }

  Future<FoodRecipe?> getAllFoodRecipes() async {
    return await network<FoodRecipe>(
      request: (request) => request.get(
        "/food-recipes?populate=*",
      ),
      headers: {'Authorization': "Bearer ${getEnv('AUTH_USER_KEY')}"},
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
