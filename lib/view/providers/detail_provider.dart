import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:i_beer/model/model.dart';
import 'package:i_beer/viewmodel/detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProvider extends StatelessWidget {
  final Widget child;
  final BeerViewModel beerViewModel;

  const DetailProvider({
    Key? key,
    required this.child,
    required this.beerViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailViewModel>(
      create: (_) => DetailViewModel(
        CachedBeerRepository(
          BeerRemoteService(
            Provider.of<Dio>(context),
            Provider.of<SharedPreferences>(context),
            Provider.of<Connectivity>(context),
          ),
        ),
        beerViewModel,
      ),
      child: child,
    );
  }
}
