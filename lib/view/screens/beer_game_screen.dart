import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_beer/common/common.dart';

/// TODO Add some animation
class BeerGameScreen extends StatefulWidget {
  const BeerGameScreen({Key? key}) : super(key: key);

  @override
  State<BeerGameScreen> createState() => _BeerGameScreenState();
}

class _BeerGameScreenState extends State<BeerGameScreen> {
  Color color = Colors.red;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(
              () {
                color = Color(Random().nextInt(0xffffffff));
                counter = counter + 1;
              },
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 200,
                height: 200,
                color: color,
                child: const Icon(
                  Ibeer.beer_solid,
                  size: 150,
                  color: Colors.yellow,
                ),
              ),
              Text(counter.toString())
            ],
          ),
        ),
      ),
    );
  }
}
