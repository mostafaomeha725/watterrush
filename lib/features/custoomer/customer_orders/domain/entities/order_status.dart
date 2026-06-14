enum OrderStatus { pending, preparing, confirmed, onTheWay, delivered, cancelled }

OrderStatus getOrderStatusFromString(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return OrderStatus.pending;
    case 'preparing':
      return OrderStatus.preparing;
    case 'confirmed':
      return OrderStatus.confirmed;
    case 'on_the_way':
      return OrderStatus.onTheWay;
    case 'delivered':
      return OrderStatus.delivered;
    case 'cancelled':
      return OrderStatus.cancelled;
    default:
      return OrderStatus.pending;
  }
}
