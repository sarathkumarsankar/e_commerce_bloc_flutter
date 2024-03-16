import 'package:e_commerce_app/model/home_model.dart';
import 'package:equatable/equatable.dart'; 

// States
abstract class OrderState extends Equatable {
    @override
  List<Object?> get props => [];
}

class OrdersLoading extends OrderState {
  @override
  List<Object?> get props => []; 
}

class OrdersLoaded extends OrderState {
  final List<Order> orders;

  OrdersLoaded(this.orders);
    @override
  List<Object?> get props => [orders];

}

class OrdersError extends OrderState {
  final String error;

  OrdersError(this.error);
      @override
  List<Object?> get props => [error];
}