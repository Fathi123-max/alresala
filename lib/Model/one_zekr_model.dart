// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final oneZekr = oneZekrFromJson(jsonString);

import 'dart:convert';

List<OneZekr> oneZekrFromJson(String str) =>
    List<OneZekr>.from(json.decode(str).map((x) => OneZekr.fromJson(x)));

String oneZekrToJson(List<OneZekr> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OneZekr {
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;
  OneZekr({
    this.id,
    this.text,
    this.count,
    this.audio,
    this.filename,
  });

  OneZekr copyWith({
    int? id,
    String? text,
    int? count,
    String? audio,
    String? filename,
  }) {
    return OneZekr(
      id: id ?? this.id,
      text: text ?? this.text,
      count: count ?? this.count,
      audio: audio ?? this.audio,
      filename: filename ?? this.filename,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'count': count,
      'audio': audio,
      'filename': filename,
    };
  }

  factory OneZekr.fromMap(Map<String, dynamic> map) {
    return OneZekr(
      id: map['id'] != null ? map['id'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
      count: map['count'] != null ? map['count'] as int : null,
      audio: map['audio'] != null ? map['audio'] as String : null,
      filename: map['filename'] != null ? map['filename'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OneZekr.fromJson(String source) =>
      OneZekr.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OneZekr(id: $id, text: $text, count: $count, audio: $audio, filename: $filename)';
  }

  @override
  bool operator ==(covariant OneZekr other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.count == count &&
        other.audio == audio &&
        other.filename == filename;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        count.hashCode ^
        audio.hashCode ^
        filename.hashCode;
  }
}
