import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_state.dart';
import 'package:food_delivery/features/cart/presentation/widgets/cart_item.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/address_page/address_page_cubits.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/address_page/address_page_state.dart';
import 'package:food_delivery/features/setting/address/presentation/pages/address_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  PlacePrediction? place;
  String? address;
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetCartList());
    context.read<AddressPageCubits>().getListAddress();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading && state.cartItems.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final cartItems = state.cartItems;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.53,
                child:
                    cartItems.isEmpty
                        ? Center(
                          child: Text(
                            'Your cart is empty',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                        : ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            return CartItem(
                              item: item,
                              onDismissed: () {
                                context.read<CartBloc>().add(
                                  RemoveFromCart(item),
                                );
                              },
                            );
                          },
                        ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
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
                      BlocConsumer<AddressPageCubits, AddressPageState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          logger.w(state);
                          if (state is AddressPageLoaded) {
                            place = state.listPlace.last;
                            address = place!.displayName;
                          }
                          if (state is AddressChoosen) {
                            place = state.place;
                            address = place!.displayName;
                          }

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          const AddressPage(isCartPage: true),
                                ),
                              );
                            },
                            child: Container(
                              width: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Text(
                                address ?? '2118 Thornridge Cir. Syracuse',
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(color: const Color(0xff32343E)),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'TOTAL: ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text:
                                    '\$ ${state.totalPrice.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
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
