import 'package:nylo_framework/nylo_framework.dart';

class StorageKey {
  static String userToken = "USER_TOKEN";
  static String authUser = getEnv('AUTH_USER_KEY', defaultValue: 'AUTH_USER');

  /// Add your storage keys here...
}
