import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:i_beer/model/model.dart';
import 'package:i_beer/view/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreference = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPreferences>.value(value: sharedPreference),
        Provider<Connectivity>(create: (_) => Connectivity()),
        Provider<Dio>(create: (_) => Dio()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final login = AuthRemoteService(Provider.of<Dio>(context));
    return MaterialApp(
      title: 'iBeer',
      theme: iBeerTheme,
      home: LoginBuilder(
        future: login.login(),
        child: const HomeScreen(),
      ),
    );
  }
}

class LoginBuilder extends StatelessWidget {
  final Future future;
  final Widget child;

  const LoginBuilder({Key? key, required this.child, required this.future}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthRemoteService>(
      create: (_) => AuthRemoteService(Provider.of<Dio>(context)),
      child: FutureBuilder<void>(
        future: future,
        builder: (context, snapshot) {
          if (ConnectionState.done == snapshot.connectionState) return child;
          return const SizedBox();
        },
      ),
    );
  }
}
