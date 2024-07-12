import 'package:flutter/material.dart';

class AbilitiesWidget extends StatelessWidget {
  final List<dynamic> abilities;
  const AbilitiesWidget({super.key, required this.abilities});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      height: 50,      
      child: Flexible(      
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: abilities.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Text(abilities[index]['ability']['name']),
                    abilities[index]['is_hidden'] ? const Text('Hidden Ability') : Text('Ability ${abilities[index]['slot']}'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}