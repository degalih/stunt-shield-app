import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? provider;
  String? jwt;

  User();

  User.fromJson(dynamic data) {
    this.firstName = data['user']['firstName'];
    this.lastName = data['user']['lastName'];
    this.email = data['user']['email'];
    this.username = data['user']['username'];
    this.provider = data['user']['provider'];
    this.jwt = data['jwt'];
  }

  toJson() => {
        "firstName": this.firstName,
        "lastName": this.lastName,
        "email": this.email,
        "username": this.username,
        "provider": this.provider,
        "jwt": this.jwt,
      };
}
