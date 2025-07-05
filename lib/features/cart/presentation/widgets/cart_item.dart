import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_state.dart';
import 'package:food_delivery/features/setting/address/presentation/pages/address_page.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.item, required this.onDismissed});
  final CartModel item;
  final void Function() onDismissed;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    void increase() {
      cartBloc.add(IncreaseQuantity(widget.item.id, 1));
    }

    void decrease() {
      if (widget.item.quantity > 1) {
        cartBloc.add(DecreaseQuantity(widget.item));
      }
    }

    return Dismissible(
      key: ValueKey(widget.item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        widget.onDismissed();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            content: Text('${widget.item.name} removed from cart'),
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
              imageUrl: widget.item.imgUrl,
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
                    widget.item.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$ ${widget.item.price}',
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
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          int quantity =
                              state.cartItems
                                  .firstWhere(
                                    (cartItem) => cartItem.id == widget.item.id,
                                    orElse: () => widget.item,
                                  )
                                  .quantity;
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
