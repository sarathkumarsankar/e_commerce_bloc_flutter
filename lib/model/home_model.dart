enum OrderStatus {
  open,
  closed,
}

class Order {
  final String orderId;
  final String customerName;
  final OrderStatus status;

  Order({
    required this.orderId,
    required this.customerName,
    required this.status,
  });
}
