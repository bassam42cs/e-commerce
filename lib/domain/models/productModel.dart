class ProductModel {
  final int id;
  final String name;
  final String category;
  final String image;
  final String description;
  final double price;
  int quantity; // Remove 'final' to make it mutable

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}
