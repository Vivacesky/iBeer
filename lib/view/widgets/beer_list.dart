import 'package:flutter/material.dart';
import 'package:i_beer/model/model.dart';

class BeerList extends StatelessWidget {
  final List<BeerViewModel> beers;

  const BeerList({Key? key, required this.beers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (beers.isEmpty) return const Center(child: Text("No beers found"));
    return ListView(
      children: beers
          .map(
            (b) => ListTile(
              title: Text(b.name),
            ),
          )
          .toList(),
    );
  }
}
