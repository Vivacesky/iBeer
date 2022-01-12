import 'package:flutter/material.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/view/view.dart';
import 'package:i_beer/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    if (vm.exception != null) return BasicErrorBody(object: vm.exception!);
    if (vm.isLoading) return const Center(child: CircularProgressIndicator());
    if (vm.beers != null) return BeerList(beers: vm.beers!);
    return const SizedBox();
  }
}
