import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/order_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/bloc/order_bloc.dart';
import 'package:e_commerce_app/bloc/order_event.dart';
import 'package:e_commerce_app/bloc/order_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OpenOrderBloc>(
          create: (context) => OpenOrderBloc()..add(FetchOrders()),
        ),
        BlocProvider<ClosedOrderBloc>(
          create: (context) => ClosedOrderBloc()..add(FetchOrders()),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('E-commerce App'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Open Orders'),
                Tab(text: 'Completed Orders'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BlocBuilder<OpenOrderBloc, OrderState>(
                builder: (context, state) {
                  return OrderList(orderState: state,);
                },
              ),
              BlocBuilder<ClosedOrderBloc, OrderState>(
                builder: (context, state) {
                  return OrderList(orderState: state,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
