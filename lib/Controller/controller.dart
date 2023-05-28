import 'package:get/get.dart';
import 'package:resala/Model/azkar_model.dart';
import 'package:resala/services/servicse_local.dart';

class AzkarController extends GetxController {
  var azkarList = <Azkar>[].obs;
  var AllazkarList = <Array>[].obs;
  var AllazkarListFromSabahMassa = <Array>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadAzkarData();
    loadAllAzkarFromCatogries();
    loadAllAzkarFromSabahMassa();
  }

  Future<void> loadAzkarData() async {
    azkarList.value = await getCatogryList();
  }

  Future<void> loadAllAzkarFromCatogries() async {
    AllazkarList.value = await getAzkarOfCategory(getCatogryList());
  }

  Future<void> loadAllAzkarFromSabahMassa() async {
    AllazkarListFromSabahMassa.value =
        await getAzkarOfSabahMassa(getCatogryList());
  }
}
