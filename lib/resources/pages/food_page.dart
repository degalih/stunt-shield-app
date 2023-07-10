import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class FoodPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/food';

  FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends NyState<FoodPage> {
  User? user;
  @override
  init() async {
    super.init();
    user = await Auth.user<User>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text('Token: ${user?.jwt}'),
        Text('Nama: ${user?.firstName}'),
        Text('Ini adalah halaman resep'),
      ],
    ));
  }
}
