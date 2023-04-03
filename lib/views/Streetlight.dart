import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:sams/controllers/fetching.dart';

class streetlight extends StatefulWidget {
  const streetlight({Key? key}) : super(key: key);

  @override
  State<streetlight> createState() => _streetlightState();
}

class _streetlightState extends State<streetlight> {
  @override
  void initState() {
    super.initState();
    getMessages(value);
  }

  var working = "false";
  String message = "null";
  Map<dynamic, dynamic> _data = {"": ""};
  dynamic _value;
  var firebase = {};
  getMessages(value) async {
    FirebaseDatabase.instance
        .ref()
        .child("street_light/$value/LOCATION")
        .onValue
        .listen((event) {
      final data = Map<dynamic, dynamic>.from(event.snapshot.value as Map);
      data.forEach((key, value) {
        setState(() {
          _data = data;
          firebase = Map<String, dynamic>.from(data);
        });
      });
    });
  }

  Widget func(value) {
    getMessages(value);
    var mykey = [];
    firebase.keys.forEach((key) {
      mykey.add(key);
    });
    List<Widget> mylist = [];
    for (int i = 0; i < firebase.length; i++) {
      print(firebase[mykey[i]]);
      if (firebase[mykey[i]] == "WORKING") {
        setState(() {
          working = "false";
        });
      } else {
        setState(() {
          working = "true";
        });
      }
      mylist.add(
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    mykey[i],
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    firebase[mykey[i]].toString(),
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }
    // ignore: unnecessary_new
    return Column(
      children: [
        Container(
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.shade400,
                  blurRadius: 5.0,
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: mylist,
              ),
            ),
          ),
        ),
      ],
    );
  }

  final items = [
    'Select Device to Track',
    'light01',
    'light02',
    'light03',
    'light04',
    'light05',
    'light06',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('STREET LIGHTS'),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: img(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Container(
                      child: DropdownButton<dynamic>(
                          value: value,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(
                                () => this.value = value,
                              )),
                    ),
                  ),
                )
              ],
            ),
            // value == "light01"
            //     ? Padding(
            //         padding: const EdgeInsets.all(30.0),
            //         child: Column(
            //           children: [
            //             func(),
            //           ],
            //         ),
            //       )
            //     : const Padding(
            //         padding: EdgeInsets.all(20.0),
            //         child: Text(
            //           "NO DATA IS GIVEN FOR THE SPECIFIED FIELD",
            //           style: TextStyle(
            //             fontSize: 14,
            //             color: Colors.red,
            //           ),
            //         ),
            //       ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  func(value),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: working == "false"
                                      ? Colors.green
                                      : Colors.grey,
                                  boxShadow: [
                                    new BoxShadow(
                                      blurStyle: BlurStyle.outer,
                                      color: Colors.grey.shade200,
                                      blurRadius: 5.0,
                                    ),
                                  ]),
                              child: SizedBox(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: working == "true"
                                      ? Colors.red
                                      : Colors.grey.shade400,
                                  boxShadow: [
                                    new BoxShadow(
                                      blurStyle: BlurStyle.outer,
                                      color: Colors.grey.shade200,
                                      blurRadius: 5.0,
                                    ),
                                  ]),
                              child: SizedBox(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
