class Product {
  final String id;
  final String title;
  final String description;

  final int price;
  final String imageUrl;
  final String productCategoryName;
  final String brand;
  final int quantity;
  final bool isFavourite;
  final bool isPopular;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.productCategoryName,
      required this.brand,
      required this.quantity,
      this.isFavourite = false,
      required this.isPopular});
}
