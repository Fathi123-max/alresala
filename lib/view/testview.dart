import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';
import '../test/awasom_notifcation.dart';

class AzkarScreen extends StatefulWidget {
  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final AzkarController azkarController = Get.put(AzkarController());

  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    NotificationController.startListeningNotificationEvents();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Azkar'),
      ),
      body: Center(
        child: Obx(
          () => azkarController.AllazkarListFromSabahMassa.isEmpty
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: azkarController.AllazkarListFromSabahMassa.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            NotificationController.scheduleNewNotification(
                                title:
                                    "${azkarController.azkarList[0].category}",
                                body: azkarController
                                    .AllazkarListFromSabahMassa[index].text);
                          }

                          //  assetsAudioPlayer.open(
                          //   Audio("${azkarController.azkarList[0].audio}"),
                          ,
                          child:
                              Text("${azkarController.azkarList[0].category}"),
                        ),
                        ListTile(
                          title: Text(azkarController
                                  .AllazkarListFromSabahMassa[index].text ??
                              ''),
                          leading: ElevatedButton(
                              onPressed: () => assetsAudioPlayer.open(
                                    Audio(
                                        "${azkarController.AllazkarListFromSabahMassa[index].audio}"),
                                  ),
                              child: Text("Play Zekr")),
                        ),
                      ],
                    );
                  }),
        ),
      ),
    );
  }
}
