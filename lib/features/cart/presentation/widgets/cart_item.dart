import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/presentation/cubits/cart_cubits.dart';
import 'package:food_delivery/features/cart/presentation/cubits/cart_state.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.item, required this.onDismissed});
  final CartModel item;
  final void Function() onDismissed;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int quantity;
  @override
  void initState() {
    quantity = widget.item.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final cartCubits = context.read<CartCubits>();

    void increase() {
      setState(() {
        quantity += 1;
      });
      cartCubits.increaseQuantity(item.id, 1);
    }

    void decrease() {
      if (quantity > 1) {
        setState(() {
          quantity -= 1;
        });
      }

      cartCubits.decreaseQuantity(item);
    }

    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        widget.onDismissed();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            content: Text('${item.name} removed from cart'),
            margin: const EdgeInsets.only(bottom: 25),
          ),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: item.imgUrl,
              width: 136,
              height: 117,
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 126,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$ ${item.price}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: increase,
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                      const SizedBox(width: 5),
                      BlocConsumer<CartCubits, CartState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          print(state);
                          return Text(
                            quantity.toString(),
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: decrease,
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
