import 'package:flutter/services.dart';
import 'package:resala/Model/azkar_model.dart';

Future<List<Azkar>> getLocalAzkarData() async {
  String jsonString = await rootBundle.loadString('assets/adhkar.json');

  List<Azkar> azkarList = azkarFromJson(jsonString);

  return azkarList;
}







  // Iterable decodedJson = json.decode(jsonString);
  // List<Azkar> azkarList =
  //     List<Azkar>.from(decodedJson.map((e) => Azkar.fromJson(e)));
