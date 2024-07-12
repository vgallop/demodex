import 'package:demodex/models/pokemon.dart';

class Pokedex {
  final int id;
  final List<Pokemon> pokemon;
  final String region;

  Pokedex({
    required this.id,
    required this.pokemon,
    required this.region
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) {
    List<Pokemon> allPokemon=[];    
    for (var eachPokemon in json['pokemon_entries']) {
      final pokemon = Pokemon.fromJsonSimple(eachPokemon);         
      allPokemon.add(pokemon);      
    }
    return Pokedex(
      id: json['id'], 
      pokemon: allPokemon, 
      region: json['region'] == null ? 'National' : json['region']['name']);
  }
}