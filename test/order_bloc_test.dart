import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app/bloc/order_bloc.dart';
import 'package:e_commerce_app/bloc/order_state.dart';
import 'package:e_commerce_app/bloc/order_event.dart';
import 'package:e_commerce_app/model/home_model.dart';

void main() {
  group('BaseOrdersBloc', () {
    BaseOrdersBloc baseOrdersBloc =
        OpenOrderBloc(); 

    setUp(() {
      baseOrdersBloc = OpenOrderBloc(); 
    });

    tearDown(() {
      baseOrdersBloc.close();
    });

    test('Initial state is OrdersLoading', () {
      expect(baseOrdersBloc.state, OrdersLoading());
    });

    blocTest<BaseOrdersBloc, OrderState>(
      'Emits [OrdersLoading, OrdersLoaded] when FetchOrders is added',
      build: () => baseOrdersBloc,
      act: (bloc) => bloc.add(FetchOrders()),
      expect: () {
        return [
          isA<OrdersLoading>(),
          isA<OrdersLoaded>().having(
            (state) => state.orders,
            'orders',
            containsAll([
              isA<Order>(),
              isA<Order>(),
            ]),
          ),
        ];
      },
    );
  });

  group('OpenOrderBloc', () {
    OpenOrderBloc openOrderBloc = OpenOrderBloc();

    tearDown(() {
      openOrderBloc.close();
    });

    test('Initial state is OrdersLoading', () {
      expect(openOrderBloc.state, OrdersLoading());
    });

    blocTest<OpenOrderBloc, OrderState>(
      'Emits [OrdersLoading, OrdersLoaded] when FetchOrders is added',
      build: () => openOrderBloc,
      act: (bloc) => bloc.add(FetchOrders()),
      expect: () {
        return [
          isA<OrdersLoading>(),
          isA<OrdersLoaded>().having(
            (state) => state.orders,
            'orders',
            containsAll([
              isA<Order>(),
              isA<Order>(),
            ]),
          ),
        ];
      },
    );
  });

  group('ClosedOrderBloc', () {
    ClosedOrderBloc closedOrderBloc = ClosedOrderBloc();

    tearDown(() {
      closedOrderBloc.close();
    });

    test('Initial state is OrdersLoading', () {
      expect(closedOrderBloc.state, OrdersLoading());
    });

    blocTest<ClosedOrderBloc, OrderState>(
      'Emits [OrdersLoading, OrdersLoaded] when FetchOrders is added',
      build: () => closedOrderBloc,
      act: (bloc) => bloc.add(FetchOrders()),
      expect: () {
        return [
          isA<OrdersLoading>(),
          isA<OrdersLoaded>().having(
            (state) => state.orders,
            'orders',
            containsAll([
              isA<Order>(),
              isA<Order>(),
            ]),
          ),
        ];
      },
    );
  });
}
