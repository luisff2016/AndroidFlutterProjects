import 'dart:async';
import 'package:app_star_wars/models/character.dart';
import 'package:app_star_wars/models/film.dart';
import 'package:app_star_wars/models/planet.dart';


abstract class IStarWarsApi {
  Future<List<Film>> getFilms();
  Future<List<Character>> getCharacters();
  Future<List<Planet>> getPlanets();
}