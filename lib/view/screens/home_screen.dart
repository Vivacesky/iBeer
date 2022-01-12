import 'package:flutter/material.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/view/screens/beer_game_screen.dart';
import 'package:i_beer/view/widgets/home_body.dart';
import 'package:i_beer/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("iBeer"),
        actions: [
          IconButton(
            onPressed: () {
              vm.switchListStyle();
            },
            icon: Icon(vm.listStyle != ListStyle.grid ? Icons.grid_view : Icons.list),
          ),

          /// Add custom icon
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BeerGameScreen(),
                ),
              );
            },
            icon: const Icon(Ibeer.beerSolid),
          )
        ],
      ),
      body: const HomeBody(),
    );
  }
}
