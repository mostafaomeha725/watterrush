enum OrderStatus { pending, confirmed, onTheWay, delivered, cancelled }

class OrderDummyModel {
  final String id;
  final String date;
  final String paymentMethod;
  final double amount;
  final OrderStatus status;

  const OrderDummyModel({
    required this.id,
    required this.date,
    required this.paymentMethod,
    required this.amount,
    required this.status,
  });
}
