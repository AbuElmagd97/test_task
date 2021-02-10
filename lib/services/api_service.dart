import 'dart:io';
import 'package:dio/dio.dart';
import 'package:testtask/config.dart';
import 'package:testtask/model/img.dart';

class ApiService {
  Future<List<Img>> getImages([int page = 1]) async {
    int _perPage = 100;
    List<Img> data = List<Img>();
    try {
      String url = "${Config.baseUrl}$page&limit=$_perPage";
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Img.fromJson(i),
        )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }
  getMoreImages() {
    for(int i = 0; i< 1000; i++){
      getImages();
    }
  }
}
