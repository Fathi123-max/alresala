// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final azkar = azkarFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:resala/Model/one_zekr_model.dart';

List<Azkar> azkarFromJson(String str) =>
    List<Azkar>.from(json.decode(str).map((x) => Azkar.fromJson(x)));
//
String azkarToJson(List<Azkar> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Azkar {
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<OneZekr>? zekrList;
  Azkar({
    this.id,
    this.category,
    this.audio,
    this.filename,
    this.zekrList,
  });

  Azkar copyWith({
    int? id,
    String? category,
    String? audio,
    String? filename,
    List<OneZekr>? zekrList,
  }) {
    return Azkar(
      id: id ?? this.id,
      category: category ?? this.category,
      audio: audio ?? this.audio,
      filename: filename ?? this.filename,
      zekrList: zekrList ?? this.zekrList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'audio': audio,
      'filename': filename,
      'zekrList': zekrList?.map((x) => x.toMap()).toList(),
    };
  }

  factory Azkar.fromMap(Map<String, dynamic> map) {
    return Azkar(
      id: map['id'] != null ? map['id'] as int : null,
      category: map['category'] != null ? map['category'] as String : null,
      audio: map['audio'] != null ? map['audio'] as String : null,
      filename: map['filename'] != null ? map['filename'] as String : null,
      zekrList: map['zekrList'] != null
          ? List<OneZekr>.from(
              (map['zekrList'] as List<int>).map<OneZekr?>(
                (x) => OneZekr.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Azkar.fromJson(source) =>
      Azkar.fromMap(source as Map<String, dynamic>);

  @override
  String toString() {
    return 'Azkar(id: $id, category: $category, audio: $audio, filename: $filename, zekrList: $zekrList)';
  }

  @override
  bool operator ==(covariant Azkar other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.category == category &&
        other.audio == audio &&
        other.filename == filename &&
        listEquals(other.zekrList, zekrList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        audio.hashCode ^
        filename.hashCode ^
        zekrList.hashCode;
  }
}
