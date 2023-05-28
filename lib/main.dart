import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:resala/test/awasom_notifcation.dart';
import 'package:resala/view/testview.dart';

void main() async {
  await NotificationController.initializeLocalNotifications();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // The navigator key is necessary to navigate using static methods
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Color mainColor = const Color(0xFF9D50DD);

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  // This widget is the root of your application.

  static const String routeHome = '/', routeNotification = '/notification-page';

  @override
  void initState() {
    NotificationController.startListeningNotificationEvents();
    super.initState();
  }

  List<Route<dynamic>> onGenerateInitialRoutes(String initialRouteName) {
    List<Route<dynamic>> pageStack = [];
    pageStack.add(MaterialPageRoute(builder: (_) => AzkarScreen()));
    if (initialRouteName == routeNotification &&
        NotificationController.initialAction != null) {
      pageStack.add(MaterialPageRoute(
          builder: (_) => NotificationPage(
              receivedAction: NotificationController.initialAction!)));
    }
    return pageStack;
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(
            builder: (_) =>
                const MyHomePage(title: 'Awesome Notifications Example App'));

      case routeNotification:
        ReceivedAction receivedAction = settings.arguments as ReceivedAction;
        return MaterialPageRoute(
            builder: (_) => NotificationPage(receivedAction: receivedAction));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Awesome Notifications - Simple Example',
      navigatorKey: MyApp.navigatorKey,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}








/*

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}
*/


/*
// overlay entry point
@pragma("vm:entry-point")
void showOverlay() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: MyOverlaContent()));
}
*/


/*
class MyOverlaContent extends StatefulWidget {
  const MyOverlaContent({Key? key}) : super(key: key);

  @override
  State<MyOverlaContent> createState() => _MyOverlaContentState();
}

class _MyOverlaContentState extends State<MyOverlaContent> {
  String _dataFromApp = "Hey send data";

  @override
  void initState() {
    super.initState();

    // lisent for any data from the main app
    FlutterOverlayApps.overlayListener().listen((event) {
      setState(() {
        _dataFromApp = event.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          // close overlay
          FlutterOverlayApps.closeOverlay();
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
              child: Text(
            _dataFromApp,
            style: const TextStyle(color: Colors.red),
          )),
        ),
      ),
    );
  }
}
*/

/* Center(
          child: ElevatedButton(
              onPressed: () async {
                // Open overlay
                await FlutterOverlayApps.showOverlay(
                    height: 300,
                    width: 400,
                    alignment: OverlayAlignment.topRight);

                // send data to ovelay
                await Future.delayed(const Duration(seconds: 2));
                FlutterOverlayApps.sendDataToAndFromOverlay("how are you man ");
              },
              child: const Text("showOverlay")),
        ), */
/*Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: FutureBuilder<List<Azkar>>(
              future: getLocalAzkarData(),
              builder: (context, snapshot) {
                var size = MediaQuery.of(context).size;
                var allZekrCat2 = snapshot.data!
                    .map((e) => e.zekrList!.map((e) => e.text).toList())
                    .toList();
                List<String> allZekrCat = [];
                for (var zeka in allZekrCat2) {
                  zeka.map((e) {
                    allZekrCat.add(e!);
                    return;
                  }).toList();
                }

                return snapshot.hasData
                    ? Column(
                        children: [
                          SizedBox(
                            height: size.height * .5,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                var zekr = allZekrCat[index];

                                return Center(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        // Open overlay
                                        await FlutterOverlayApps.showOverlay(
                                            height: 300,
                                            width: 400,
                                            alignment:
                                                OverlayAlignment.topRight);

                                        // send data to ovelay
                                        await Future.delayed(
                                            const Duration(seconds: 2));
                                        FlutterOverlayApps
                                            .sendDataToAndFromOverlay("$zekr");
                                      },
                                      child: const Text("showOverlay")),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : const CircularProgressIndicator();
              })),
     */
