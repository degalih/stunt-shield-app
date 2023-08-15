import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class PosterListPage extends NyStatefulWidget {
  final Controller controller = Controller();
  
  static const path = '/poster-list';
  
  PosterListPage({Key? key}) : super(key: key);
  
  @override
  _PosterListPageState createState() => _PosterListPageState();
}

class _PosterListPageState extends NyState<PosterListPage> {

  @override
  init() async {
    super.init();
    
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
