import 'package:demodex/controllers/pokedex_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home/home.dart';
import 'pages/details/pokemon_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PokedexController())
      ],
      child: MaterialApp(      
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          PokemonDetails.routeName: (context)=> PokemonDetails(pokemonId: 1,)
        },
      ),
    );
  }
}
