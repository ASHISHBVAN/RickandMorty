import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Characterlogic{
  Dio dio = new Dio();
  List list = [];
  var response;

  Future<List?> info(headpoint, gender, name) async {
    try {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
      for (int i = 0; i < headpoint.length; i++) {
        if (name != '') {
          response = await dio
              .get('https://rickandmortyapi.com/api/character/?name=$name');
          return json.decode(response.toString())['results'];
        } else {
          response = await dio.get(
              'https://rickandmortyapi.com/api/character/${headpoint[i].toString().split('/').last}');
        }

        if (name == '' &&
            gender == json.decode(response.toString())['gender']) {
          list.add(json.decode(response.toString()));
        } else if (name == '' && gender == 'Unknown') {
          list.add(json.decode(response.toString()));
        }
      }

      return list;
    } catch (e) {
      print(e);
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
