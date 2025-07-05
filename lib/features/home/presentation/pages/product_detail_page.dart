import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_state.dart';

import 'package:food_delivery/features/cart/presentation/pages/cart_page.dart';

import 'package:food_delivery/features/home/domain/entities/product_model.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/setting/address/presentation/pages/address_page.dart';
import 'package:food_delivery/pages/main_page.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late final AppUser user;
  @override
  void initState() {
    user = context.read<AuthCubits>().currentUser!;
    super.initState();
  }

  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartAddSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                  'Added to your cart',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.white),
                ),
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.green[800],
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: appbarPart(context),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(color: MyColor.imageBackground),
                child: Image.asset(
                  'assets/food_pattern.png',
                  repeat: ImageRepeat.repeatY,
                  color: MyColor.imageBackground2,
                ),
              ),
              Positioned(
                child: Container(
                  width: size.width,
                  height: size.height * 0.75,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 90),
                      Hero(
                        tag: widget.product.name,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          height: 320,
                          imageUrl: widget.product.imageDetail,
                          placeholder:
                              (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: MyColor.primary,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                              ),
                              const SizedBox(width: 5),
                              Text(
                                quantity.toString(),
                                style: Theme.of(
                                  context,
                                ).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (quantity < 10) {
                                      quantity++;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                widget.product.specialItems,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  letterSpacing: 1.1,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$ ',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: MyColor.primary,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.product.price.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          infoItem(
                            'assets/icons/star.png',
                            widget.product.rate.toString(),
                          ),
                          infoItem(
                            'assets/icons/fire.png',
                            '${widget.product.kcal.toString()} Kcal',
                          ),
                          infoItem(
                            'assets/icons/time.png',
                            widget.product.time,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ReadMoreText(
                        desc,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          height: 1.5,
                          color: Colors.black,
                        ),
                        trimMode: TrimMode.Length,
                        trimLength: 110,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: 'Read Less',
                        colorClickableText: MyColor.primary,
                        moreStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyColor.primary,
                        ),
                        lessStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyColor.primary,
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton.extended(
            elevation: 0,
            backgroundColor: Colors.transparent,
            onPressed: () {},
            label: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              height: 65,
              minWidth: 350,
              color: MyColor.primary,
              onPressed: () {
                final cartItem = CartModel.fromProduct(
                  widget.product,
                  quantity,
                );
                try {
                  context.read<CartBloc>().add(AddToCart(cartItem, quantity));
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Try again!'),
                        content: Text(e.toString()),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text(
                'Add to Cart',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.3,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row infoItem(src, value) {
    return Row(
      children: [
        Image.asset(src, width: 25),
        const SizedBox(width: 10),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
      ],
    );
  }

  AppBar appbarPart(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      actions: [
        const SizedBox(width: 27),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ), // BoxDecoration
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 18,
            ),
          ),
        ), // I
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder:
                    (_) => BlocProvider.value(
                      value: BlocProvider.of<CartBloc>(context),
                      child: const CartPage(),
                    ),
              ),
            );
          },
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ), // BoxDecoration
            child: const Icon(
              Iconsax.shopping_cart_copy,
              color: Colors.black,
              size: 18,
            ),
          ),
        ), // Icon
        const SizedBox(width: 27),
      ],
    );
  }
}
