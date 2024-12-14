import 'package:flutter/material.dart';
import '../models/car.dart';
import '../services/loan_calculator.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;

  CarDetailsScreen({required this.car});

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  final TextEditingController downPaymentController = TextEditingController();
  final TextEditingController monthsController = TextEditingController();
  double? monthlyPayment;

  void calculatePayment() {
    final double downPayment = double.tryParse(downPaymentController.text) ?? 0;
    final int months = int.tryParse(monthsController.text) ?? 0;
    const double interestRate = 1.5;

    final double payment = LoanCalculator.calculateMonthlyPayment(
      widget.car.price,
      downPayment,
      months,
      interestRate,
    );

    setState(() {
      monthlyPayment = payment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.brand + ' ' + widget.car.model),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Marca: ${widget.car.brand}', style: TextStyle(fontSize: 20)),
            Text('Modelo: ${widget.car.model}', style: TextStyle(fontSize: 20)),
            Text('Preço: R\$${widget.car.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('Cálculo de Parcelamento', style: TextStyle(fontSize: 24)),
            TextField(
              controller: downPaymentController,
              decoration: InputDecoration(labelText: 'Entrada'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: monthsController,
              decoration: InputDecoration(labelText: 'Número de Parcelas'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: calculatePayment,
              child: Text('Calcular'),
            ),
            if (monthlyPayment != null)
              Text('Valor da Parcela: R\$${monthlyPayment!.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}