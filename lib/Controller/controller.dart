import 'package:get/get.dart';
import 'package:resala/Controller/servicse_local.dart';
import 'package:resala/Model/azkar_model.dart';

class AzkarController extends GetxController {
  var azkarList = <Azkar>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadAzkarData();
  }

  Future<void> loadAzkarData() async {
    azkarList.value = await getLocalAzkarData();
  }
}
