import 'dart:convert';

import 'package:dio/dio.dart';

abstract class AuthService {
  Future<void> login();
}

class AuthRemoteService implements AuthService {
  final String _baseUrl = "https://icapps-nodejs-beers-api.herokuapp.com/api/v1/auth";
  final Dio client;

  AuthRemoteService(this.client);

  @override
  Future<void> login() async {
    final body = {
      "username": "star_developer@icapps.com",
      "password": "developer",
    };
    final result = await client.post<Map<String, dynamic>>("$_baseUrl/login", data: jsonEncode(body));
    if (result.data != null) {
      client.interceptors.add(
        InterceptorsWrapper(
          onRequest: (request, handler) {
            request.headers["Authorization"] = "Bearer " + result.data!["data"]["accessToken"];
            return handler.next(request);
          },
        ),
      );
    }
  }
}
