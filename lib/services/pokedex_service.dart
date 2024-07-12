import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokedex.dart';

class PokedexService{
  static const baseUrl = 'https://pokeapi.co/api/v2/pokedex';

  Future<Pokedex> getPokedex(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));    
    if (response.statusCode == 200){         
      return Pokedex.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get Pokedex data');
    }
  }
}