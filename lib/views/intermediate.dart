import 'package:flutter/material.dart';
import 'package:sams/views/Streetlight.dart';

class intermediate extends StatefulWidget {
  const intermediate({Key? key}) : super(key: key);

  @override
  State<intermediate> createState() => _intermediateState();
}

class _intermediateState extends State<intermediate> {
  Widget mybutton(name, lat, long, buildId, battery) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => streetlight(),
            ));
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 90,
            width: double.infinity,
            // ignore: unnecessary_new
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.white,
                boxShadow: [
                  // ignore: unnecessary_new
                  new BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Colors.grey.shade400,
                    blurRadius: 5.0,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "System $name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("Battery Status: $battery")
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("lat: $lat"),
                      Text("lat: $long"),
                      Text("Uid: $buildId"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devices"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "The data for given device are shown below ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        mybutton("1", "28.7525 ", "77.4987", "162522", "0%"),
        mybutton("2", "-----", "-----", "162533", "0%"),
        mybutton("3", "-----", "-----", "162584", "0%"),
        mybutton("4", "-----", "-----", "162545", "0%"),
      ]),
    );
  }
}
