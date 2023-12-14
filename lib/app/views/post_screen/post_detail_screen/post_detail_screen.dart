import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/models/postModel/post_model.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

class PostDetailScreen extends StatelessWidget {
  PostDetailScreen({super.key});
  PostModel property = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FutureBuilder(
                future: precacheImage(
                    NetworkImage(property.featuredImages!), context),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      )),
                    );
                  } else {
                    return Image.network(
                      property.featuredImages!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              property.title!,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: ${property.price}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
                Row(
                  children: [
                    const Text(
                      "Status: ",
                      style: TextStyle(fontSize: 16, color: kDarkBgColor),
                    ),
                    property.status == true
                        ? Text(
                            "Active",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'UnPublished',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                          ),
                  ],
                ),
              ],
            ).paddingOnly(right: 20),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Advance Amount: ${property.advanceAmount}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
                Text(
                  'Installments: ${property.monthlyInstallments}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
              ],
            ).paddingOnly(right: 20),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bedrooms: ${property.bedroooms}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
                Text(
                  'Bathrooms: ${property.bathroom}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
              ],
            ).paddingOnly(right: 20),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Plot Number: ${property.plotNumber}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
                Text(
                  'City: ${property.city}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
              ],
            ).paddingOnly(right: 20),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Area: ${property.area}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
                Text(
                  'Total Area: ${property.totalAreaSize}',
                  style: const TextStyle(fontSize: 18, color: kDarkBgColor),
                ),
              ],
            ).paddingOnly(right: 20),
            const SizedBox(height: 10),
            // Add more property details here
            Text(
              'Description: ${property.longDescription}',
              style: const TextStyle(fontSize: 18, color: kDarkBgColor),
            ),

            // Continue for all other properties...
          ],
        ),
      ),
    );
  }
}
