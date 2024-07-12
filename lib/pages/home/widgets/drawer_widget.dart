import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:demodex/controllers/pokedex_controller.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> regionNames = [
      'National Dex',
      'Kanto Dex',
      'Johto Dex',
      'Hoen Dex'
    ];
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: context.watch<PokedexController>().pokedex == index + 1
              ? const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/R.50e5a11b866f739cf5904f1fc0f80535?rik=o8mumcl4LvHtwQ&riu=http%3a%2f%2fpurepng.com%2fpublic%2fuploads%2flarge%2fpurepng.com-pokeballpokeballdevicepokemon-ballpokemon-capture-ball-17015278258617bdog.png&ehk=a3mBf1C3uxf0QyBVX4dlwEfOeMbi1aVLsnascatqQ%2f4%3d&risl=&pid=ImgRaw&r=0'),
                )
              : const SizedBox(),
          title: Text(regionNames[index]),
          onTap: () {
            context.read<PokedexController>().setPokedex(newPokedex: index + 1);
            Navigator.pop(context);
          },
        );
      },
      itemCount: regionNames.length,
    );
  }
}
