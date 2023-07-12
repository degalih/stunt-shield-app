import '/app/providers/jwt_expired_provider.dart';
import '/../app/providers/auth_provider.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/providers/app_provider.dart';
import '/app/providers/event_provider.dart';
import '/app/providers/route_provider.dart';

final Map<Type, NyProvider> providers = {
  AppProvider: AppProvider(),
  RouteProvider: RouteProvider(),
  EventProvider: EventProvider(),
  AuthProvider: AuthProvider(),
  JwtExpiredProvider: JwtExpiredProvider(),
};
