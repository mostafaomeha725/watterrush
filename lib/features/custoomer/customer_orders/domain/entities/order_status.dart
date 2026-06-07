enum OrderStatus { pending, inProgress, onTheWay, delivered, cancelled }

OrderStatus getOrderStatusFromString(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return OrderStatus.pending;
    case 'in_progress':
      return OrderStatus.inProgress;
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
