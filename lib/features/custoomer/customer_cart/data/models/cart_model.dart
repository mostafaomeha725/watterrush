import '../../domain/entities/cart_entity.dart';
import 'cart_item_model.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.id,
    required super.items,
    required super.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? 0,
      items: json['items'] != null
          ? List<CartItemModel>.from(
              json['items'].map((x) => CartItemModel.fromJson(x)),
            )
          : [],
      total: json['total'] ?? 0,
    );
  }
}
