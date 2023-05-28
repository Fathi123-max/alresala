import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/test/awasom_notifcation.dart';

import '../Controller/controller.dart';

class AzkarScreen extends StatefulWidget {
  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final AzkarController azkarController = Get.put(AzkarController());

  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
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
                          onTap: () async {
                            NotificationController.cancelNotifications();
                            // Get.to(NotifvationCenter());
                            //   String localTimeZone = await AwesomeNotifications()
                            //       .getLocalTimeZoneIdentifier();
                            //   String utcTimeZone = await AwesomeNotifications()
                            //       .getLocalTimeZoneIdentifier();

                            //   await AwesomeNotifications().createNotification(
                            //       content: NotificationContent(
                            //           id: 2,
                            //           channelKey: 'alerts',
                            //           title:
                            //               'Notification at every single minute',
                            //           body:
                            //               'This notification was schedule to repeat at every single minute.',
                            //           notificationLayout:
                            //               NotificationLayout.BigPicture,
                            //           bigPicture:
                            //               'asset://assets/images/melted-clock.png'),
                            //       schedule: NotificationInterval(
                            //           interval: 60,
                            //           timeZone: localTimeZone,
                            //           repeats: true));
                            //   NotificationController.scheduleNewNotification(
                            //       title:
                            //           "${azkarController.azkarList[0].category}",
                            //       body: azkarController
                            //           .AllazkarListFromSabahMassa[index].text);
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
