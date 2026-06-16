import '../../domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.id,
    super.productId,
    super.bundleId,
    required super.title,
    required super.price,
    required super.image,
    required super.quantity,
    required super.itemSubtotal,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      productId: json['product_id'],
      bundleId: json['bundle_id'],
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      image: json['image'] ?? '',
      quantity: json['quantity'] ?? 0,
      itemSubtotal: json['item_subtotal'] ?? 0,
    );
  }
}
