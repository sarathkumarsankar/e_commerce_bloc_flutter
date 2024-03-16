import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/order_widget.dart';
import 'package:e_commerce_app/bloc/order_state.dart';

class OrderList extends StatelessWidget {
  final OrderState orderState;

  const OrderList({super.key, required this.orderState});

  @override
  Widget build(BuildContext context) {
  if (orderState is OrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (orderState is OrdersLoaded) {
          final orders = (orderState as OrdersLoaded).orders; 
          return Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderWidget(order: order);
              },
            ),
          );
        } else if (orderState is OrdersError) {
          final error = (orderState as OrdersError); 
          return Center(
            child: Text(error.toString()),
          );
        } else {
          return Container(); 
        }
  }
}

