enum OrderStatus { pending, inProgress, onTheWay, delivered, cancelled }

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

class OrdersDummyData {
  static const List<OrderDummyModel> orders = [
    OrderDummyModel(
      id: '7',
      date: '04 Jun 2026',
      paymentMethod: 'Cash on Delivery',
      amount: 870.00,
      status: OrderStatus.pending,
    ),
    OrderDummyModel(
      id: '6',
      date: '01 Jun 2026',
      paymentMethod: 'Cash on Delivery',
      amount: 870.00,
      status: OrderStatus.pending,
    ),
    OrderDummyModel(
      id: '5',
      date: '01 Jun 2026',
      paymentMethod: 'Cash on Delivery',
      amount: 662.00,
      status: OrderStatus.inProgress,
    ),
    OrderDummyModel(
      id: '4',
      date: '01 Jun 2026',
      paymentMethod: 'Cash on Delivery',
      amount: 825.00,
      status: OrderStatus.inProgress,
    ),
    OrderDummyModel(
      id: '3',
      date: '12 Jun 2026',
      paymentMethod: 'Cash on Delivery',
      amount: 1655.00,
      status: OrderStatus.onTheWay,
    ),
    OrderDummyModel(
      id: '2',
      date: '14 Jun 2026',
      paymentMethod: 'Cash on Delivery',
      amount: 1655.00,
      status: OrderStatus.delivered,
    ),
    OrderDummyModel(
      id: '1',
      date: '14 Jun 2026',
      paymentMethod: 'Cash on Delivery',
      amount: 1050.00,
      status: OrderStatus.cancelled,
    ),
  ];
}
