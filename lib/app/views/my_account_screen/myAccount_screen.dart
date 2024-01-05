import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Account'),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            ListTile(
              title: const Text('Favorites & Saved searches'),
              subtitle: const Text('All of your favorite ads & saved filters'),
              leading: const Icon(
                Icons.star,
                color: kPrimaryColor,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: const Text('My Ads'),
              subtitle: const Text('Manage your ads'),
              leading: const Icon(
                Icons.list,
                color: kPrimaryColor,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: const Text('Buy Discounted Packages'),
              subtitle: const Text(
                  'Sell faster, more & at higher margins with packages'),
              leading: const Icon(
                Icons.monetization_on,
                color: kPrimaryColor,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.toNamed('/account/package-screen');
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: const Text('Orders and Billing Info'),
              subtitle: const Text('Orders, billing and invoices'),
              leading: const Icon(
                Icons.shopping_cart,
                color: kPrimaryColor,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            // ListTile(
            //   title: const Text('Delivery Orders'),
            //   subtitle:
            //       const Text('Track your selling or buying delivery orders'),
            //   leading: const Icon(Icons.local_shipping),
            //   trailing: const Icon(Icons.chevron_right),
            //   onTap: () {},
            // ),
            ListTile(
              title: const Text('Settings'),
              subtitle: const Text('Privacy and manage account'),
              leading: const Icon(
                Icons.settings,
                color: kPrimaryColor,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: const Text('Help & Support'),
              subtitle: const Text('Help center and legal terms'),
              leading: const Icon(
                Icons.help,
                color: kPrimaryColor,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
