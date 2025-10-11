import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/constants/helper.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_state.dart';
import 'dart:async';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.item, required this.onDismissed});
  final CartModel item;
  final void Function() onDismissed;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  Timer? _debounceTimer;
  int _pendingQuantity = 0;
  int _increaseCount = 0;
  int _decreaseCount = 0;

  @override
  void initState() {
    super.initState();
    _pendingQuantity = widget.item.quantity;
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _debounce(VoidCallback callback) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), callback);
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    void increase() {
      setState(() {
        _pendingQuantity += 1;
        _increaseCount += 1;
        _decreaseCount = 0;
      });

      _debounce(() {
        if (_increaseCount > 0) {
          cartBloc.add(IncreaseQuantity(widget.item.id, _increaseCount));
          _increaseCount = 0;
        }
      });
    }

    void decrease() {
      if (_pendingQuantity > 1) {
        setState(() {
          _pendingQuantity -= 1;
          _decreaseCount += 1;
          _increaseCount = 0;
        });

        _debounce(() {
          if (_decreaseCount > 0) {
            final updatedItem = CartModel(
              id: widget.item.id,
              name: widget.item.name,
              quantity: widget.item.quantity - _decreaseCount,
              price: widget.item.price,
              imgUrl: widget.item.imgUrl,
            );
            cartBloc.add(DecreaseQuantity(updatedItem));
            _decreaseCount = 0;
          }
        });
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.item.price.toVND(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        TextSpan(
                          text: ' VNĐ',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: MyColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: decrease,
                          padding: const EdgeInsets.all(8),
                        ),
                      ),

                      const SizedBox(width: 5),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          // If there's no active debounce and no pending counts, update pending quantity
                          if (!(_debounceTimer?.isActive ?? false) &&
                              _increaseCount == 0 &&
                              _decreaseCount == 0) {
                            final stateQuantity =
                                state.cartItems
                                    .firstWhere(
                                      (cartItem) =>
                                          cartItem.id == widget.item.id,
                                      orElse: () => widget.item,
                                    )
                                    .quantity;

                            if (_pendingQuantity != stateQuantity) {
                              _pendingQuantity = stateQuantity;
                            }
                          }

                          return Text(
                            _pendingQuantity.toString(),
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: increase,
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
