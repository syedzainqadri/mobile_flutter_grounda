import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kWhiteColor,
          ),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/profile-screen');
                    },
                    child: const CircleAvatar(
                      radius: 43,
                      backgroundColor: kDarkBgColor,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: kWhiteColor,
                        child: Center(
                          child: Image(
                            height: 42,
                            width: 42,
                            image: AssetImage('assets/images/mountains.webp'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectName,
                          textScaleFactor: 1.0,
                        ),
                      ],
                    ),
                  )
                ],
              )),
              GestureDetector(
                onTap: () {
                  // Get.toNamed('/policy-screen');
                },
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.shieldHalved,
                    color: kDarkBgColor,
                  ),
                  title: Text(
                    'Privacy Policy',
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.toNamed('/term-screen');
                },
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.fileContract,
                    color: kDarkBgColor,
                  ),
                  title: Text(
                    'Term and Conditions',
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () async {
                  // Clear all boxes
                  await Hive.deleteFromDisk();

                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
