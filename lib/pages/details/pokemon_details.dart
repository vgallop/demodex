import 'package:demodex/models/pokemon.dart';
import 'package:demodex/pages/details/widgets/abilities_widget.dart';
import 'package:demodex/pages/details/widgets/meassurement_widget.dart';
import 'package:demodex/pages/details/widgets/stats_widget.dart';
import 'package:demodex/pages/details/widgets/type_widget.dart';
import 'package:demodex/services/pokemon_service.dart';
import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {
  final int pokemonId;
  static const String routeName = "Details";
  PokemonDetails({super.key, required this.pokemonId});

  final _pokemonService = PokemonService();
  final String imgUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon>(
      future: _pokemonService.getPokemon(pokemonId),
      builder: (context, AsyncSnapshot pokemon) {
        if (pokemon.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text('#${pokemon.data.id} ${pokemon.data.name}'),
            ),
            body: Flexible(
              child: Column(children: [
                Image.network('$imgUrl/${pokemon.data.id}.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TypeWidget(types: pokemon.data.types),
                    MeassurementWidget(label: 'Height', meassurement: pokemon.data.height),
                    MeassurementWidget(label: 'Weight', meassurement: pokemon.data.weight),                                    
                  ],
                ),
                const Divider(height: 1, indent: 24, endIndent: 24,),
                AbilitiesWidget(abilities: pokemon.data.abilities),
                const Divider(height: 1, indent: 24, endIndent: 24,),
                StatsWidget(stats: pokemon.data.stats)
              ],),
            )
          );
        } else {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Loading Pokemon Data'),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}
