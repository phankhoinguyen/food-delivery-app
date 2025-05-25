import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List<Widget> listBody = [
    const HomePage(),
    const FavoritePage(),
    const MockDemo(),
    const Scaffold(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                const Positioned(
                  top: 16,
                  right: 1,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: MyColor.primary,
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 12, color: Colors.white),
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
