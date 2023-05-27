import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:resala/view/testview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: AzkarScreen());
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
