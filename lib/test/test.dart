import 'package:flutter/material.dart';

import '../Controller/servicse_local.dart';
import '../Model/azkar_model.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Azkar>>(
        future: getLocalAzkarData(),
        builder: (context, snapshot) {
          var size = MediaQuery.of(context).size;
          var allZekrCat2 = snapshot.data!
              .map((e) => e.array!.map((e) => e.text).toList())
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
                        itemCount: allZekrCat.length,
                        itemBuilder: (BuildContext context, int index) {
                          var zekr = allZekrCat[index];

                          return ListTile(
                            title: Text(zekr),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const CircularProgressIndicator();
        });
  }
}
