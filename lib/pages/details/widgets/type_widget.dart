import 'package:flutter/material.dart';

class TypeWidget extends StatelessWidget {
  final List<dynamic> types;
  const TypeWidget({super.key, required this.types});

  @override
  Widget build(BuildContext context) {        
    return SizedBox(
      height: 44,
      width: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: types.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Text(types[index]['type']['name']),
                Text('Type ${index + 1}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
