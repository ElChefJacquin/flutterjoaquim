class Car {
  final String brand;
  final String model;
  final double price;

  Car({required this.brand, required this.model, required this.price});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      brand: json['brand'],
      model: json['model'],
      price: json['price'].toDouble(),
    );
  }
}