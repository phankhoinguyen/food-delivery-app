import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/constants/helper.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/favorite/domain/entities/favorite_model.dart';
import 'package:food_delivery/features/favorite/presentation/cubits/favorite_cubits.dart';
import 'package:food_delivery/features/favorite/presentation/cubits/favorite_state.dart';
import 'package:food_delivery/features/home/domain/entities/product_model.dart';
import 'package:food_delivery/features/home/presentation/pages/product_detail_page.dart';
import 'package:food_delivery/core/theme/my_color.dart';

class ProductItem extends StatefulWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final favoriteItem = FavoriteModel.fromProduct(widget.product);

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder:
                (_, _, _) => BlocProvider.value(
                  value: BlocProvider.of<CartBloc>(context),
                  child: ProductDetailPage(product: widget.product),
                ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 35,
            child: Container(
              height: 180,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 20,
                    color: Colors.black.withAlpha(10),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -1,
            right: 0,
            child: GestureDetector(
              onTap: () {
                context.read<FavoriteCubits>().toogleFavorite(favoriteItem);
              },

              child: BlocBuilder<FavoriteCubits, FavoriteState>(
                builder: (context, state) {
                  bool isActive = context.read<FavoriteCubits>().isExist(
                    favoriteItem.id,
                  );
                  return CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        isActive ? Colors.purple[100] : Colors.transparent,
                    child:
                        isActive
                            ? Image.asset(
                              'assets/icons/fire.png',
                              width: 18,
                              height: 18,
                            )
                            : Image.asset(
                              'assets/icons/fire.png',
                              width: 13,
                              height: 13,
                              color: Colors.red,
                            ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: size.width * .5,
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 20,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Hero(
                  tag: widget.product.name,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: 140,
                    width: 150,
                    imageUrl: widget.product.imageCard,
                    placeholder:
                        (context, url) => const CircularProgressIndicator(),
                  ),
                ),
                // const SizedBox(height: 15),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                    maxLines: 1,
                  ),
                ),
                // const SizedBox(height: 15),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.product.geoID,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      // fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                  ),
                ),
                // const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.product.price.toVND(),
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge!.copyWith(fontSize: 25),
                      ),
                      TextSpan(
                        text: ' VNĐ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: MyColor.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
