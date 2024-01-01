import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_methods.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

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
                  Get.toNamed('/product-screen');
                },
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.productHunt,
                    color: kDarkBgColor,
                  ),
                  title: Text(
                    'Products',
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/account-screen');
                },
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.userLarge,
                    color: kDarkBgColor,
                  ),
                  title: Text(
                    'My Account',
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/post/mypost-screen');
                },
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.clipboard,
                    color: kDarkBgColor,
                  ),
                  title: Text(
                    'My Posts',
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/agency-screen');
                },
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.peopleGroup,
                    color: kDarkBgColor,
                  ),
                  title: Text(
                    'Agency',
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              // add size box
              SizedBox(
                height: getHeight(context) * 0.3,
              ),
              // add divider
              const Divider(
                height: 2,
                thickness: 0.5,
                color: kDarkBgColor,
              ),
              // add size box
              const SizedBox(
                height: 15,
              ),
              CommonElevatedButton(
                  text: 'Logout',
                  buttonColor: kPrimaryColor,
                  onPressed: () async {
                    // Clear all boxes
                    await Hive.deleteFromDisk();

                    // Then close the drawer
                    Navigator.pop(context);
                    Get.offAllNamed('/login-screen');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
