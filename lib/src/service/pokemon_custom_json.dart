// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

List<customJSON> customJSONFromJson(String str) => List<customJSON>.from(json.decode(str).map((x) => customJSON.fromJson(x)));

String customJSONToJson(List<customJSON> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class customJSON {
  customJSON({
    required this.name,
    required this.url,
    required this.image,
  });

  String name;
  String url;
  String image;

  factory customJSON.fromJson(Map<String, dynamic> json) => customJSON(
    name: json["name"],
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "image": image,
  };
}
