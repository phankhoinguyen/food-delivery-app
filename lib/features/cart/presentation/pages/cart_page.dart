import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/presentation/cubits/cart_cubits.dart';
import 'package:food_delivery/features/cart/presentation/cubits/cart_state.dart';
import 'package:food_delivery/features/cart/presentation/widgets/cart_item.dart';
import 'package:food_delivery/theme/my_color.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final List<CartModel> listCart;
  double total = 0;
  @override
  void initState() {
    listCart = context.read<CartCubits>().listCartLocal;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double calculateTotal(List<CartModel> listCart) {
      double total = 0;
      for (var item in listCart) {
        total += item.price * item.quantity;
      }
      return total;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.53,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: listCart.length,
              itemBuilder: (context, index) {
                final item = listCart[index];
                return CartItem(
                  item: item,
                  onDismissed: () {
                    setState(() {
                      listCart.remove(item);
                    });
                    context.read<CartCubits>().removeFromList(item);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffA4A4A4),
                borderRadius: BorderRadiusDirectional.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('DELIVERY ADDRESS'),
                  const SizedBox(height: 7),
                  Container(
                    width: 350,
                    child: Text(
                      '2118 Thornridge Cir. Syracuse',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color(0xff32343E),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<CartCubits, CartState>(
                    builder: (context, state) {
                      final listCart = context.read<CartCubits>().listCartLocal;
                      final total = calculateTotal(listCart);
                      return Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'TOTAL: ',
                                style:
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyLarge!.copyWith(),
                              ),
                              TextSpan(
                                text: '\$ ${total.toStringAsFixed(2)}',
                                style:
                                    Theme.of(
                                      context,
                                    ).textTheme.titleLarge!.copyWith(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () {},
          label: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            height: 55,
            minWidth: 350,
            color: MyColor.primary,
            onPressed: () {},
            child: Text(
              'PLACE ORDER',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
