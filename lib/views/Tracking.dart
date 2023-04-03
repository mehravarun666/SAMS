import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
//bhavya
  @override
  void initState() {
    super.initState();
    getMessages();
  }

  String message = "null";
  Map<dynamic, dynamic> _data = {"": ""};
  dynamic _value;
  var firebase = {};
  getMessages() async {
    FirebaseDatabase.instance
        .ref()
        .child("LGT_loc/truck_id")
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

  Widget func() {
    var mykey = [];
    firebase.keys.forEach((key) {
      mykey.add(key);
    });
    List<Widget> mylist = [];
    for (int i = 0; i < firebase.length; i++) {
      mylist.add(
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
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      );
    }
    // ignore: unnecessary_new
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: mylist,
    );
  }

//bhavya

  final items = [
    'Select Device to Track',
    'RJ30CE1999',
    'GJ01CX1991',
    'HR04BN1887',
    'PB13LJ3347',
    'KR12NB3021',
    'DL32FB4545',
  ];
  String? value;
  var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Track',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Coal India Pvt.ltd',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.car_crash_outlined,
            color: Colors.blueAccent,
          ),
          Container(
            child: DropdownButton<dynamic>(
                value: value,
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(
                      () => this.value = value,
                    )),
          ) //const Text('RJ30CS0119'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    //action code for button 1
                  },
                  backgroundColor: Colors.green,
                  child: Icon(Icons.call),
                )),
            Text("CALL")
          ],
        ), //button first

        Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    //Navigator.push(
                    //  context,
                    // MaterialPageRoute(
                    //    builder: (context) => OrderTrackingPage()));
                    //action code for button 2
                  },
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Icon(Icons.near_me),
                )),
            const Text("TRACK"),
          ],
        ), // button second

        Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    // Navigator.push(
                    //  context,
                    // MaterialPageRoute(
                    //    builder: (context) => verification()));
                    //action code for button 3
                  },
                  backgroundColor: Colors.deepOrangeAccent,
                  child: Icon(Icons.file_copy),
                )),
            const Text("DATA"),
          ],
        ), // button third

        // Add more buttons here
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(30),
      child: Text(
        'Details:-',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Asset Tracking',
      home: Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
            title: const Text('Asset Tracking'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: ListView(
          children: [
            const Image(
              image: AssetImage('assets/images/GPStracking .jpg'),
            ),
            titleSection,
            buttonSection,
            textSection,
            value == "RJ30CE1999"
                ? Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: [
                        func(),
                      ],
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "NO DATA IS GIVEN FOR THE SPECIFIED FIELD",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
