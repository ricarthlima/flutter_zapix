class Product {
  String id;
  String? icon;
  String name;
  String description;
  double price;

  Product({
    required this.id,
    this.icon,
    required this.name,
    required this.description,
    required this.price,
  });
}
