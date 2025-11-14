import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_delivery/features/order/presentation/bloc/order_bloc.dart';
import 'package:food_delivery/features/order/presentation/bloc/order_event.dart';
import 'package:food_delivery/features/order/presentation/bloc/order_state.dart';
import 'package:food_delivery/features/order/presentation/components/order_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    context.read<OrderBloc>().add(const GetOrderList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('Your Orders')),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.listOrder == null || state.listOrder!.isEmpty) {
            return const Center(child: Text('Your orders are empty now!'));
          }

          return ListView.builder(
            itemCount: state.listOrder!.length,
            itemBuilder: (context, index) {
              return OrderCard(orderItem: state.listOrder![index]);
            },
          );
        },
      ),
    );
  }
}
