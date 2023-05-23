// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_overlay_apps/flutter_overlay_apps.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:resala/test/testnot.dart';
// import 'package:timezone/data/latest_all.dart' as tzALL;
// import 'package:timezone/timezone.dart' as tz;

// import '../Controller/servicse_local.dart';
// import '../Model/azkar_model.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await _configureLocalTimeZone();

//   // Initialize the local notifications plugin
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Initialize the settings for your app
//   var initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   var initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//   runApp(MyApp(flutterLocalNotificationsPlugin));
// }

// Future<void> _configureLocalTimeZone() async {
//   if (kIsWeb || Platform.isLinux) {
//     return;
//   }
//   tzALL.initializeTimeZones();
//   final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
//   tz.setLocalLocation(tz.getLocation(timeZoneName!));
// }

// class MyApp extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin notificationsPlugin;

//   MyApp(this.notificationsPlugin);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Simple App With Notifications',
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Simple App With Notifications'),
//           ),
//           body: FutureBuilder<List<Azkar>>(
//               future: getLocalAzkarData(),
//               builder: (context, snapshot) {
//                 var size = MediaQuery.of(context).size;
//                 var allZekrCat2 = snapshot.data!
//                     .map((e) => e.array!.map((e) => e.text).toList())
//                     .toList();
//                 List<String> allZekrCat = [];
//                 for (var zeka in allZekrCat2) {
//                   zeka.map((e) {
//                     allZekrCat.add(e!);
//                     return;
//                   }).toList();
//                 }

//                 return snapshot.hasData
//                     ? Column(
//                         children: [
//                           SizedBox(
//                             height: size.height * .5,
//                             child: ListView.builder(
//                               itemCount: 1,
//                               itemBuilder: (BuildContext context, int index) {
//                                 var zekr = allZekrCat[index];

//                                 return Column(
//                                   children: [
//                                     ElevatedButton(
//                                         onPressed: () async {
//                                           await _showBigTextNotification(zekr);
//                                         },
//                                         child: Text("Show Big")),
//                                     Center(
//                                       child: ElevatedButton(
//                                           onPressed: () async {
//                                             // Open overlay
//                                             showNotification(
//                                                 notificationsPlugin, zekr);
//                                             await FlutterOverlayApps
//                                                 .showOverlay(
//                                                     height: 300,
//                                                     width: 400,
//                                                     alignment: OverlayAlignment
//                                                         .topRight);

//                                             // send data to ovelay
//                                             await Future.delayed(
//                                                 const Duration(seconds: 2));
//                                             FlutterOverlayApps
//                                                 .sendDataToAndFromOverlay(
//                                                     "$zekr");
//                                           },
//                                           child: const Text("showOverlay")),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       )
//                     : const CircularProgressIndicator();
//               })),
//     );
//   }
// }

// // Function that shows the local notification
// void showNotification(
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
//     String zekr) async {
//   var androidDetails = AndroidNotificationDetails('channel_id', 'channel_name',
//       color: Colors.amber,
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//       actions: []);
//   var generalNotificationDetails =
//       new NotificationDetails(android: androidDetails);
//   // show
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'Fathi',
//     '''$zekr \n \n \n ''',
//     generalNotificationDetails,
//     payload: 'notification_payload',
//   );

//   await flutterLocalNotificationsPlugin.zonedSchedule(0, "allahAkbar", zekr,
//       _nextInstanceOfTenAM(zekrTime: 20), generalNotificationDetails,
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime);
// }

// // show notifcatoin
// Future<void> _showBigTextNotification(String zekr) async {
//   BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//     'Lorem <i>ipsum dolor sit</i> amet, consectetur <b>$zekr',
//     htmlFormatBigText: true,
//     contentTitle: 'overridden <b>big</b> content title',
//     htmlFormatContentTitle: true,
//     summaryText: 'summary <i>text</i>',
//     htmlFormatSummaryText: true,
//   );

//   AndroidNotificationDetails androidNotificationDetails =
//       AndroidNotificationDetails('big text channel id', 'big text channel name',
//           channelDescription: 'big text channel description',
//           color: Colors.amber,
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: 'ticker',
//           actions: [
//             AndroidNotificationAction('action_id', 'Action text',
//                 inputs: <AndroidNotificationActionInput>[
//                   AndroidNotificationActionInput(
//                     label: 'Enter a message',
//                   ),
//                 ]),
//             AndroidNotificationAction(
//               'action_id',
//               'Action text',
//             ),
//             AndroidNotificationAction(
//               'action_id',
//               'Action text',
//             ),
//           ],
//           styleInformation: bigTextStyleInformation);
//   NotificationDetails notificationDetails =
//       NotificationDetails(android: androidNotificationDetails);
//   await flutterLocalNotificationsPlugin.zonedSchedule(
//       id++,
//       'big text title',
//       'silent body',
//       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 1)),
//       notificationDetails,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime);
// }

// //fun <int , scheld time>
// tz.TZDateTime _nextInstanceOfTenAM({int? zekrTime}) {
//   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   tz.TZDateTime scheduledDate =
//       tz.TZDateTime(tz.local, now.year, now.month, now.day, zekrTime!);
//   if (scheduledDate.isBefore(now)) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// // Function that handles the notification when it is clicked on (not used in this example)
// Future onDidReceiveLocalNotification(
//     int id, String title, String body, String payload) async {}
