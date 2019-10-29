import 'package:app_star_wars/services/swapi_service.dart';
import 'package:app_star_wars/view_models/main_page_view_model.dart';
import 'package:app_star_wars/views/pages/main_page.dart';
import 'package:flutter/material.dart';

final MainPageViewModel mainPageVM = MainPageViewModel(apiSvc: SwapiService());

void main() => runApp(MvvmApp(mainPageVM: mainPageVM));

class MvvmApp extends StatelessWidget {
  final MainPageViewModel mainPageVM;

  MvvmApp({@required this.mainPageVM});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Exemplo MVVM Flutter',
      theme: new ThemeData(
        primaryColor: Color(0xff070707),        
        primaryColorLight: Color(0xff0a0a0a),
        primaryColorDark: Color(0xff000000),
      ),
      home: MainPage(viewModel: mainPageVM),
      debugShowCheckedModeBanner: false,
    );
  }
}