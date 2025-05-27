import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/cart/data/cart_repo_firestore.dart';
import 'package:food_delivery/features/cart/presentation/cubits/cart_cubits.dart';
import 'package:food_delivery/features/cart/presentation/cubits/cart_state.dart';
import 'package:food_delivery/features/cart/presentation/pages/cart_page.dart';
import 'package:food_delivery/features/favorite/presentation/pages/favorite_page.dart';
import 'package:food_delivery/features/home/presentation/pages/home_page.dart';
import 'package:food_delivery/pages/mock_demo.dart';
import 'package:food_delivery/theme/my_color.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final AppUser user;

  List<Widget> listBody = [
    const HomePage(),
    const FavoritePage(),
    const MockDemo(),
    const CartPage(),
  ];
  int currentIndex = 0;
  @override
  void initState() {
    user = context.read<AuthCubits>().currentUser!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartRepo = CartRepoFirestore(user);
    return BlocProvider(
      create: (context) => CartCubits(cartRepo)..getListCart(),
      child: BlocConsumer<CartCubits, CartState>(
        builder: (context, state) {
          int cartQuantity = 0;
          if (state is CartLoaded) {
            cartQuantity = state.listCart.length;
          }
          return Scaffold(
            body: listBody[currentIndex],
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(bottom: 0),
              height: 80,
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  navItem(Iconsax.home_1, 'A', 0),
                  navItem(Iconsax.heart_copy, 'B', 1),
                  const SizedBox(width: 90),
                  navItem(Iconsax.notification_copy, 'C', 2),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      navItem(Iconsax.shopping_cart_copy, 'D', 3),
                      Positioned(
                        top: 16,
                        right: 1,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: MyColor.primary,
                          child: Text(
                            cartQuantity.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: -25,
                        right: 140,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: MyColor.primary,
                          child: Icon(
                            CupertinoIcons.search,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is CartError) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Try again!'),
                  content: Text(state.msg),
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
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: currentIndex == index ? MyColor.primary : Colors.grey,
            ),
            const SizedBox(height: 3),
            CircleAvatar(
              radius: 3,
              backgroundColor:
                  currentIndex == index ? MyColor.primary : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
