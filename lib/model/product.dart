class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final String installment;
  final String colors;
  final bool freeShipping;
  int rating;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.installment,
    required this.colors,
    required this.freeShipping,
    this.rating = 0,
  });
}
