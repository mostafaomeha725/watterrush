class CartItemEntity {
  final int id;
  final int? productId;
  final int? bundleId;
  final String title;
  final num price;
  final String image;
  final int quantity;
  final num itemSubtotal;

  const CartItemEntity({
    required this.id,
    this.productId,
    this.bundleId,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.itemSubtotal,
  });
}
