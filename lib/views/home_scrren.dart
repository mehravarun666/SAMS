import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sams/controllers/data_controller.dart';
import 'package:sams/views/Streetlight.dart';
import 'package:sams/views/Tracking.dart';
import 'package:sams/views/drawer_screen.dart';
import 'package:sams/views/intermediate.dart';
import 'package:sams/views/plantation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController controller = Get.put(DataController());
//functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ASSETS'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Column(
        
        children: [
          const Padding(padding: EdgeInsets.all(40),
          child: Text("Select Your Asset",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'raleway',
          ),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  child: InkWell(
                    splashColor: Colors.black26,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Tracking()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: const AssetImage(
                              "assets/images/tracking_button.png"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'LOGISTICS',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  child: InkWell(
                    splashColor: Colors.black26,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const intermediate()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image:
                              const AssetImage("assets/images/streetlight.jpg"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'STREET LIGHT ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  child: InkWell(
                    splashColor: Colors.black26,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Plantation()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image:
                              const AssetImage("assets/images/plantation.jpg"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'PLANTATION',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(28),
                  child: InkWell(
                    splashColor: Colors.black26,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Invalid Choice'),
                          content: const Text(
                              'There is no data for asset named Water Treatment'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close')),
                          ],
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: const AssetImage("assets/images/water.jpg"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'WATER TREATMENT',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
