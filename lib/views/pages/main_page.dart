import 'dart:async';
import 'package:app_star_wars/view_models/main_page_view_model.dart';
import 'package:app_star_wars/views/widgets/characteres_panel.dart';
import 'package:app_star_wars/views/widgets/films_panel.dart';
import 'package:app_star_wars/views/widgets/planets_panel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';


class MainPage extends StatefulWidget {
  final MainPageViewModel viewModel;

  MainPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  Future loadData() async {
    await widget.viewModel.setFilms();
    await widget.viewModel.setCharacters();
    await widget.viewModel.setPlanets();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Star Wars',
          style: TextStyle(
            fontFamily: 'Distant Galaxy',
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(icon: Icon(FontAwesomeIcons.film)),
            Tab(icon: Icon(FontAwesomeIcons.users)),
            Tab(icon: Icon(FontAwesomeIcons.globeAmericas))
          ],
        ),
      ),
      body: ScopedModel<MainPageViewModel>(
        model: widget.viewModel,
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            FilmsPanel(),
            CharactersPanel(),
            PlanetsPanel(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}