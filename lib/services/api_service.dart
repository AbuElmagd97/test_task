import 'dart:io';
import 'package:dio/dio.dart';
import 'package:testtask/config.dart';
import 'package:testtask/model/img.dart';

class ApiService {
  Future<List<Img>> getImages(int page) async {
    List<Img> data = List<Img>();
    try {
      String url = "${Config.baseUrl}$page";
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        data = (response.data as List).map((e) => Img.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }
}
