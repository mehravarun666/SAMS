import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sams/controllers/data_controller.dart';
import 'package:sams/views/login_screen.dart';


class AppDrawer extends StatelessWidget {
  final DataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const FittedBox(
                      child: Image(
                        image: AssetImage('assets/images/admin.png'),
                        height: 140,
                      ),
                    ),
                    Text(
                      'User : ${controller.userProfileData['userName']}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    FittedBox(
                      child: Text(
                        'Join Date :${DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(controller.userProfileData['joinDate']))} ',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.notification_add),
                title: const Text('Notifications'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Your Product'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.announcement_rounded),
                title: const Text('About Us'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Get.to(() => LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
