import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:i_beer/model/model.dart';
import 'package:i_beer/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends StatelessWidget {
  final Widget child;

  const HomeProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(
        CachedBeerRepository(
          BeerRemoteService(
            Provider.of<Dio>(context),
            Provider.of<SharedPreferences>(context),
            Provider.of<Connectivity>(context),
          ),
        ),
      ),
      child: child,
    );
  }
}
