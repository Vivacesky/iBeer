import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:i_beer/common/common.dart';

/// TODO Add some animation
class BeerGameScreen extends StatefulWidget {
  const BeerGameScreen({Key? key}) : super(key: key);

  @override
  State<BeerGameScreen> createState() => _BeerGameScreenState();
}

class _BeerGameScreenState extends State<BeerGameScreen> with SingleTickerProviderStateMixin {
  Color color = Colors.red;
  int counter = 0;
  late final ConfettiController _confettiController;

  late final AnimationController _controller;

  @override
  void initState() {
    _confettiController = ConfettiController(duration: const Duration(seconds: 10));
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.addStatusListener(_updateStatus);
    super.initState();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 1. create a Tween
    late Animation<double> _sineAnimation = Tween(
      begin: 0.0,
      end: 1.0,
      // 2. animate it with a CurvedAnimation
    ).animate(
      CurvedAnimation(
        parent: _controller,
        // 3. use our SineCurve
        curve: const ShakeCurve(),
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                _controller.forward();
                setState(
                  () {
                    color = Color(Random().nextInt(0xffffffff));
                    counter = counter + 1;
                    if (counter % 100 == 0) _confettiController.play();
                  },
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    curve: Curves.elasticOut,
                    duration: const Duration(milliseconds: 500),
                    width: Random().nextInt(100) + 200,
                    height: 400,
                    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                    child: AnimatedBuilder(
                      animation: _sineAnimation,
                      child: const Icon(
                        Ibeer.beerSolid,
                        size: 140,
                        color: Colors.yellow,
                      ),
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_sineAnimation.value * 3, 0),
                          child: child,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  AnimatedDefaultTextStyle(
                    curve: Curves.bounceIn,
                    duration: const Duration(milliseconds: 100),
                    style: TextStyle(
                      fontSize: Random().nextInt(20) + 18,
                      color: Colors.black,
                    ),
                    child: Text(
                      counter.toString(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
              createParticlePath: drawStar,
              confettiController: _confettiController,
            ),
          ),
        ],
      ),
    );
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step), halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}

class ShakeCurve extends Curve {
  const ShakeCurve();

  @override
  double transformInternal(double t) {
    return sin(5 * 2 * pi * t);
  }
}
