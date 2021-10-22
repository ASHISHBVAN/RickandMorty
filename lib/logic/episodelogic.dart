import 'dart:convert';

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Episodes {
  Dio dio = new Dio();

  Future<int?> info() async {
    try {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
      var response = await dio.get('https://rickandmortyapi.com/api/episode');
      return json.decode(response.toString())['info']['pages'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List?> result(pagenumber) async {
    try {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
      var response = await dio
          .get('https://rickandmortyapi.com/api/episode?page=$pagenumber');
      return json.decode(response.toString())['results'].toList();
    } catch (e) {
      print(e);
    }
  }
}
