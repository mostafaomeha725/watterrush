import 'cart_item_entity.dart';

class CartEntity {
  final int id;
  final List<CartItemEntity> items;
  final num total;

  const CartEntity({
    required this.id,
    required this.items,
    required this.total,
  });
}
