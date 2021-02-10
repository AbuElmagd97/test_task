// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

List<Img> imageFromJson(String str) => List<Img>.from(json.decode(str).map((x) => Img.fromJson(x)));

String imageToJson(List<Img> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Img {
  Img({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
    id: json["id"],
    author: json["author"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    downloadUrl: json["download_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author,
    "width": width,
    "height": height,
    "url": url,
    "download_url": downloadUrl,
  };
}
