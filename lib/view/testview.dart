import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';

class AzkarScreen extends StatelessWidget {
  final AzkarController azkarController = Get.put(AzkarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Azkar'),
      ),
      body: Center(
        child: Obx(
          () => azkarController.azkarList.isEmpty
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: azkarController.azkarList.length,
                  itemBuilder: (context, index) => ListTile(
                    title:
                        Text(azkarController.azkarList[index].category ?? ''),
                  ),
                ),
        ),
      ),
    );
  }
}
