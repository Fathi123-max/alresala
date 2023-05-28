import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Press me"),
              onPressed: () {
                // Show the Awesome Notifications package notification
                AwesomeNotifications().createNotification(
                  content: NotificationContent(
                    id: 1,
                    channelKey: 'key1',
                    title: 'My Notification',
                    body: 'This is my notification body!',
                    actions: [
                      NotificationAction(
                        key: 'BUTTON_KEY',
                        label: 'Button Label',
                        autoCancel: true,
                        callback: (notification) {
                          // Play the sound using flutter_ringtone_player
                          FlutterRingtonePlayer.play(
                            android: AndroidSounds.notification,
                            ios: IosSounds.glass,
                            looping: false,
                            volume: 1.0,
                            asAlarm: false,
                          );
                        },
                      ),
                    ],
                  ),
                );
                // Update the state using GetX
                Get.find<MyController>().increment();
              },
            ),
            Obx(() =>
                Text("Button Pressed ${Get.find<MyController>().count} times"))
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
          ),
          body: MyHomePage()),
    );
  }
}
