import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  // int? id;
  // String? firstName;
  // String? lastName;
  // String? email;
  // String? username;
  // String? provider;
  String? jwt;

  User();

  User.fromJson(dynamic data) {
    // id = data['user']['id'];
    // firstName = data['user']['firstName'];
    // lastName = data['user']['lastName'];
    // email = data['user']['email'];
    // username = data['user']['username'];
    // provider = data['user']['provider'];
    jwt = data['jwt'];
  }

  toJson() => {
        // "firstName": firstName,
        // "lastName": lastName,
        // "email": email,
        // "username": username,
        // "provider": provider,
        "jwt": jwt,
      };
}
