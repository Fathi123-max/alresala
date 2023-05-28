// To parse this JSON data, do
//
//     final allAzkar = allAzkarFromJson(jsonString);

import 'dart:convert';

List<Azkar> azkarFromJson(String str) =>
    List<Azkar>.from(json.decode(str).map((x) => Azkar.fromJson(x)));

String azkarToJson(List<Azkar> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Azkar {
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<Array>? array;

  Azkar({
    this.id,
    this.category,
    this.audio,
    this.filename,
    this.array,
  });

  Azkar copyWith({
    int? id,
    String? category,
    String? audio,
    String? filename,
    List<Array>? array,
  }) =>
      Azkar(
        id: id ?? this.id,
        category: category ?? this.category,
        audio: audio ?? this.audio,
        filename: filename ?? this.filename,
        array: array ?? this.array,
      );

  factory Azkar.fromJson(Map<String, dynamic> json) => Azkar(
        id: json["id"],
        category: json["category"],
        audio: json["audio"],
        filename: json["filename"],
        array: json["array"] == null
            ? []
            : List<Array>.from(json["array"]!.map((x) => Array.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "audio": audio,
        "filename": filename,
        "array": array == null
            ? []
            : List<dynamic>.from(array!.map((x) => x.toJson())),
      };
}

class Array {
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;

  Array({
    this.id,
    this.text,
    this.count,
    this.audio,
    this.filename,
  });

  Array copyWith({
    int? id,
    String? text,
    int? count,
    String? audio,
    String? filename,
  }) =>
      Array(
        id: id ?? this.id,
        text: text ?? this.text,
        count: count ?? this.count,
        audio: audio ?? this.audio,
        filename: filename ?? this.filename,
      );

  factory Array.fromJson(Map<String, dynamic> json) => Array(
        id: json["id"],
        text: json["text"],
        count: json["count"],
        audio: json["audio"],
        filename: json["filename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "count": count,
        "audio": audio,
        "filename": filename,
      };
}
