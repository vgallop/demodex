import 'package:flutter/material.dart';

class PokedexController extends ChangeNotifier{
  int pokedex = 1;

  void setPokedex({
    required int newPokedex
  }) async {
    pokedex = newPokedex;
    notifyListeners();
  }
}