import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/injection/injection.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/cart/data/cart_repo_firestore.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_state.dart';
import 'package:food_delivery/features/cart/presentation/pages/cart_page.dart';
import 'package:food_delivery/features/favorite/presentation/pages/favorite_page.dart';
import 'package:food_delivery/features/home/presentation/pages/home_page.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_event.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_state.dart';
import 'package:food_delivery/features/notification/presentation/pages/notification_page.dart';
import 'package:food_delivery/features/order/domain/repo/order_repo.dart';
import 'package:food_delivery/features/order/presentation/bloc/order_bloc.dart';
import 'package:food_delivery/features/order/presentation/pages/order_page.dart';
import 'package:food_delivery/core/theme/my_color.dart';
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
    const NotificationPage(),
    const CartPage(),
    const OrderPage(),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(cartRepo: cartRepo)..add(GetCartList()),
        ),
        BlocProvider(create: (context) => OrderBloc(getIt<OrderRepo>())),
      ],
      child: Scaffold(
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
              navItem(Icons.store, 'E', 4),
              BlocConsumer<NotificationBloc, NotificationState>(
                listener: (context, state) {},
                builder: (context, state) {
                  int? unreadQuantity = state.unreadQuantity;
                  print(unreadQuantity);
                  return Stack(
                    children: [
                      navItem(Iconsax.notification_copy, 'C', 2),
                      if (unreadQuantity != null)
                        Positioned(
                          top: 16,
                          right: 3,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: MyColor.primary,
                            child: Text(
                              unreadQuantity.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              BlocConsumer<CartBloc, CartState>(
                builder: (context, state) {
                  int cartQuantity = state.cartItems.length;

                  return Stack(
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
                    ],
                  );
                },
                listener: (context, state) {
                  if (state is CartAddSuccess) {
                    context.read<CartBloc>().add(GetCartList());
                  }
                  if (state is CartError) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Try again!'),
                          content: Text(state.message),
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
            ],
          ),
        ),
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
