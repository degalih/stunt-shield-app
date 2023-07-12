import 'package:flutter_app/app/models/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nylo_framework/nylo_framework.dart';

class JwtExpiredProvider implements NyProvider {
  boot(Nylo nylo) async {
    if (await Auth.loggedIn() == true) {
      User? user = await Auth.user();
      bool hasExpired = JwtDecoder.isExpired(user?.jwt ?? '-');
      if (hasExpired == true) {
        await Auth.remove();
      }
    }

    return nylo;
  }

  afterBoot(Nylo nylo) async {
    // Called after booting your provider
    // ...
  }
}
