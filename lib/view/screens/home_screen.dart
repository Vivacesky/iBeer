import 'package:flutter/material.dart';
import 'package:i_beer/view/providers/home_provider.dart';
import 'package:i_beer/view/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeProvider(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("iBeer"),
        ),
        body: const HomeBody(),
      ),
    );
  }
}
