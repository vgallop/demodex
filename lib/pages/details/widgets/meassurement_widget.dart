import 'package:flutter/material.dart';

class MeassurementWidget extends StatelessWidget {
  final int meassurement;
  final String label;
  const MeassurementWidget(
      {super.key, required this.label, required this.meassurement});

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: [
        Text('$meassurement ${label == 'Height' ? '"' : 'lb'}'),
        Text(label),
      ],
    );
  }
}
