import 'package:flutter/services.dart';
import 'package:resala/Model/azkar_model.dart';

Future<List<Azkar>> getCatogryList() async {
  String jsonString = await rootBundle.loadString('assets/adhkar.json');

  List<Azkar> catogryList = azkarFromJson(jsonString);

  return catogryList;
}

Future<List<Array>> getAzkarOfCategory(Future<List<Azkar>> fun) async {
  List<Azkar> listOfCategory = await fun;
  List<Array> allAzkarFromCategories = [];
  listOfCategory.forEach((category) {
    category.array!.forEach((zekrOfCategory) {
      allAzkarFromCategories.add(zekrOfCategory);
    });
  });
  allAzkarFromCategories.forEach((OneZekr) {
    print(OneZekr.text);
  });
  return allAzkarFromCategories;
}

Future<List<Array>> getAzkarOfSabahMassa(Future<List<Azkar>> fun) async {
  List<Azkar> listOfCategory = await fun;
  List<Array> allAzkarforsabahmassa = [];
  listOfCategory.forEach((category) {
    category.id == 1
        ? category.array!.forEach((element) {
            allAzkarforsabahmassa.add(element);
          })
        : [];
  });
  allAzkarforsabahmassa.forEach((OneZekr) {
    print(OneZekr.text);
  });
  return allAzkarforsabahmassa;
}








  // Iterable decodedJson = json.decode(jsonString);
  // List<Azkar> azkarList =
  //     List<Azkar>.from(decodedJson.map((e) => Azkar.fromJson(e)));
