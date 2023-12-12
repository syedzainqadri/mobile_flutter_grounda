import 'package:flutter/material.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  final List<Property> properties = [
    Property('Property 1', 'Location 1', 100000),
    Property('Property 2', 'Location 2', 200000),
    Property('Property 3', 'Location 3', 300000),
    // Add more properties here
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(properties[index].name),
            subtitle: Text(properties[index].location),
            trailing: Text('\$${properties[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}

class Property {
  final String name;
  final String location;
  final double price;

  Property(this.name, this.location, this.price);
}
