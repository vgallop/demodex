import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatsWidget extends StatelessWidget {
  final List<dynamic> stats;
  const StatsWidget({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 24),
            child: Text(
                '${stats[index]['stat']['name']}: ${stats[index]['base_stat']}'),
          );
        },
      ),
    );
  }
}
