import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_state.dart';
import 'package:food_delivery/features/cart/presentation/widgets/cart_item.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/payment/presentation/pages/payment_page.dart';
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
  List<CartModel>? cartItems;
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
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('Your Cart', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          print(size.height);
          cartItems = state.cartItems;
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: MyColor.imageBackground),
                width: double.infinity,
                height: size.height,
                child: Image.asset(
                  'assets/food_pattern.png',
                  repeat: ImageRepeat.repeatY,
                  color: MyColor.imageBackground2,
                ),
              ),
              (state is CartLoading && state.cartItems.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * .13),
                        SizedBox(
                          height: size.height * 0.5,
                          child:
                              cartItems!.isEmpty
                                  ? Center(
                                    child: Text(
                                      'Your cart is empty',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                  )
                                  : ListView.builder(
                                    padding: const EdgeInsets.all(10),
                                    itemCount: cartItems!.length,
                                    itemBuilder: (context, index) {
                                      final item = cartItems![index];
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
                      ],
                    ),
                  ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: const BorderRadiusDirectional.vertical(
                      top: const Radius.circular(20),
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width * .85, size.height * .07),

                          backgroundColor: MyColor.primary,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      PaymentPage(listProduct: cartItems!),
                            ),
                          );
                        },
                        child: Text(
                          'PLACE ORDER',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.3,
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
    );
  }
}
