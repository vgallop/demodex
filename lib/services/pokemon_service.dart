import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService{
  static const baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<Pokemon> getPokemon(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200){                  
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get Pokemon data');
    }
  }
}