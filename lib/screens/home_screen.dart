import 'package:flutter/material.dart';
import '../widgets/car_card.dart';
import '../widgets/custom_drawer.dart';
import '../models/car.dart';
import 'car_details_screen.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    loadCars();
  }

  Future<void> loadCars() async {
    final String response = await rootBundle.loadString('assets/cars_data.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      cars = data.map((car) => Car.fromJson(car)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Concessionária'),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(
            car: cars[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailsScreen(car: cars[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}