import 'package:nylo_framework/nylo_framework.dart';

class ProfileMe extends Model {
  int? id;
  String? email;
  String? firstName;
  String? lastName;

  ProfileMe();

  ProfileMe.fromJson(dynamic data) {
    id = data['id'];
    email = data['email'];
    firstName = data['firstName'];
    lastName = data['lastName'];
  }

  toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      };
}
