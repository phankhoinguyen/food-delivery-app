import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/constants/helper.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/favorite/domain/entities/favorite_model.dart';
import 'package:food_delivery/features/favorite/presentation/cubits/favorite_cubits.dart';
import 'package:food_delivery/features/home/domain/entities/product_model.dart';
import 'package:food_delivery/features/home/presentation/pages/product_detail_page.dart';
import 'package:food_delivery/core/theme/my_color.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.item, required this.product});
  final FavoriteModel item;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(seconds: 1),
              pageBuilder:
                  (_, _, _) => BlocProvider.value(
                    value: BlocProvider.of<CartBloc>(context),
                    child: ProductDetailPage(product: product),
                  ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  Hero(
                    tag: product.name,
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      width: 120,
                      height: 120,
                      imageUrl: item.imgUrl,
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        item.category,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: item.price.toVND(),
                              style: Theme.of(
                                context,
                              ).textTheme.headlineLarge!.copyWith(fontSize: 20),
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
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<FavoriteCubits>().toogleFavorite(item);
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
