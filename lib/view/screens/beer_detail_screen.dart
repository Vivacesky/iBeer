import 'package:flutter/material.dart';
import 'package:i_beer/model/model.dart';
import 'package:i_beer/view/view.dart';

class BeerDetailScreen extends StatelessWidget {
  final BeerViewModel beerViewModel;

  const BeerDetailScreen({Key? key, required this.beerViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailProvider(
      beerViewModel: beerViewModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(beerViewModel.name),
        ),
        body: const BeerDetailBody(),
      ),
    );
  }
}
