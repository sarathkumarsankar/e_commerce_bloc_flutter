import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/home_model.dart';

class OrderWidget extends StatelessWidget {
  final Order order;

  const OrderWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/avatar.jpeg'),
      title: Text(order.customerName),
      subtitle: Text(order.status.name),
    );
  }
}
