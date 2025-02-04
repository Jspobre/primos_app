class OrderObject {
  final dynamic id;
  final String name;
  final double price;
  final String? variation;
  int quantity;
  final String imageUrl;

  OrderObject(
      {required this.id,
      required this.name,
      required this.price,
      this.variation,
      required this.quantity,
      required this.imageUrl});
}
