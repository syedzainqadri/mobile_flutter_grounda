import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_flutter_grounda/app/controllers/amenitiesController/amenities_controller.dart';
import 'package:mobile_flutter_grounda/app/models/postModel/post_model.dart';
import 'package:mobile_flutter_grounda/app/widgets/icon_from_api.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  PostModel property = Get.arguments;

  var amenitiesController = Get.put(AmenitiesController());

  @override
  void initState() {
    fetchAmenities();
    super.initState();
  }

  fetchAmenities() async {
    amenitiesController.amenitiesDetails.value =
        await amenitiesController.getAllAmenities();
    setState(() {});
    debugPrint('Amenities: ${amenitiesController.amenitiesDetails}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          backgroundColor: Colors.white,
          centerTitle: true,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title!,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            property.city!,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54),
                          ),
                        ],
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
                      ).paddingOnly(right: 20),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: height * 0.27,
                width: width * 0.6,
                decoration: BoxDecoration(
                  color: kLightPrimary,
                  borderRadius: BorderRadius.circular(10),
                  // add light shadow
                  boxShadow: const [
                    BoxShadow(
                      color: kShadowColor,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          property.title!,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          property.price!,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Add divider
                    const Divider(
                      height: 20,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Installments: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              property.monthlyInstallments!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Bedrooms: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              '${property.bedroooms!}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Bathrooms: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              '${property.bathroom!}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Plot Number: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              property.plotNumber!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Area: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              property.area!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Area: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              property.totalAreaSize!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Description : ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              'Simple data, or facts, about the property such as street',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                              maxLines: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(20),
              ),
              const SizedBox(height: 10),
              const Text(
                'Features',
                style: TextStyle(
                    fontSize: 18,
                    color: kDarkBgColor,
                    fontWeight: FontWeight.bold),
              ),
              // amenitiesController.amenitiesDetails.isEmpty
              //     ? const Center(
              //         child: Text(
              //           'No amenities found',
              //           style: TextStyle(
              //               fontSize: 18,
              //               color: kDarkBgColor,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       )
              //     :
              Container(
                height: height * 0.42,
                width: width * 0.6,
                decoration: BoxDecoration(
                  color: kLightPrimary,
                  borderRadius: BorderRadius.circular(10),
                  // add light shadow
                  boxShadow: const [
                    BoxShadow(
                      color: kShadowColor,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 115),
                  itemCount: amenitiesController.amenitiesDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    final amenities =
                        amenitiesController.amenitiesDetails[index];
                    return Card(
                      color: kLightPrimary,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconFromApi(
                                        icon: amenities.icon!,
                                      ),
                                      Text(
                                        amenities.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Status: ",
                                            style: TextStyle(
                                              color: kTextColor,
                                            ),
                                          ),
                                          amenities.status!
                                              ? Text(
                                                  "Active",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.green),
                                                )
                                              : Text(
                                                  'UnPublished',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.red),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Location',
                style: TextStyle(
                    fontSize: 18,
                    color: kDarkBgColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.4,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(double.tryParse(property.latitude!)!,
                        double.tryParse(property.longitude!)!),
                    zoom: 14.4746,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
