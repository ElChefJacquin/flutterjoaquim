import 'package:flutter/material.dart';
import '../models/car.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback onTap;

  CarCard({required this.car, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(car.brand + ' ' + car.model),
        subtitle: Text('R\$${car.price.toStringAsFixed(2)}'),
        onTap: onTap,
      ),
    );
  }
}