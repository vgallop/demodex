import 'package:demodex/controllers/pokedex_controller.dart';
import 'package:demodex/models/pokedex.dart';
import 'package:demodex/pages/details/pokemon_details.dart';
import 'package:demodex/pages/home/widgets/drawer_widget.dart';
import 'package:demodex/services/pokedex_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "Home";
  HomeScreen({super.key});

  final _pokedexService = PokedexService();

  int getDexNumber(String url){
    const start = 'species/';
    final startIndex = url.indexOf(start);    
    return int.parse(url.substring(startIndex + start.length, url.length-1));
  }

  @override
  Widget build(BuildContext context) {
    int pokedexId = context.watch<PokedexController>().pokedex;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demodex'),
        ),
        drawer: const Drawer(
          child:  AppDrawerWidget(),
        ),
        body: FutureBuilder<Pokedex>(
          future: _pokedexService.getPokedex(pokedexId),
          builder: (context, AsyncSnapshot pokedex) {
            if (pokedex.connectionState == ConnectionState.done) {              
              return ListView.builder(
                  itemCount: pokedex.data.pokemon.length,
                  itemBuilder: (context, index) {
                    int dexNumber = getDexNumber(pokedex.data.pokemon[index].url);
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$dexNumber.png'),
                      ),
                      title: Text('#${pokedex.data.pokemon[index].id} ${pokedex.data.pokemon[index].name}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PokemonDetails(pokemonId: dexNumber,)),
                        );
                      },
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
