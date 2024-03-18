import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/model/home_model.dart';
import 'package:e_commerce_app/bloc/order_event.dart';
import 'package:e_commerce_app/bloc/order_state.dart';

// Base BLOC
abstract class BaseOrdersBloc extends Bloc<OrderEvent, OrderState> {
  BaseOrdersBloc(OrderState initialState) : super(initialState) {
    on<OrderEvent>(_onFetchOrders);
  }

  Future<void> _onFetchOrders(OrderEvent event, Emitter<OrderState> emit) async {
    emit(OrdersLoading());
    try {
      final orders = await _fetchOrders();
      emit(OrdersLoaded(orders));
    } catch (error) {
      emit(OrdersError('Failed to fetch orders: $error')); 
    }
  }

  Future<List<Order>> _fetchOrders();
}
// OpenOrder BLOC
class OpenOrderBloc extends BaseOrdersBloc {
  OpenOrderBloc() : super(OrdersLoading());

  @override
  Future<List<Order>> _fetchOrders() async {
    // For simplicity, returning dummy data
    return [
      Order(orderId: '1', customerName: 'Customer 1', status: OrderStatus.open),
      Order(orderId: '2', customerName: 'Customer 2', status: OrderStatus.open),
      Order(orderId: '3', customerName: 'Customer 3', status: OrderStatus.open),
      Order(orderId: '4', customerName: 'Customer 4', status: OrderStatus.open),
      Order(orderId: '5', customerName: 'Customer 5', status: OrderStatus.open),
    ];
  }
}
// ClosedOrder BLOC
class ClosedOrderBloc extends BaseOrdersBloc {
  ClosedOrderBloc() : super(OrdersLoading());

  @override
  Future<List<Order>> _fetchOrders() async {
    // For simplicity, returning dummy data
    return [
      Order(orderId: '1', customerName: 'Customer 6', status: OrderStatus.closed),
      Order(orderId: '2', customerName: 'Customer 7', status: OrderStatus.closed),
      Order(orderId: '2', customerName: 'Customer 8', status: OrderStatus.closed),
      Order(orderId: '2', customerName: 'Customer 9', status: OrderStatus.closed),
      Order(orderId: '2', customerName: 'Customer 10', status: OrderStatus.closed),
    ];
  }
}
