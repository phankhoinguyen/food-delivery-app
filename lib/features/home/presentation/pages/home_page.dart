import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/favorite/data/favorite_repo_firestore.dart';
import 'package:food_delivery/features/favorite/presentation/cubits/favorite_cubits.dart';
import 'package:food_delivery/features/favorite/presentation/cubits/favorite_state.dart';
import 'package:food_delivery/features/home/data/category_repo_firestore.dart';
import 'package:food_delivery/features/home/data/product_repo_firestore.dart';
import 'package:food_delivery/features/home/domain/entities/category_model.dart';
import 'package:food_delivery/features/home/presentation/cubits/category_cubits.dart';
import 'package:food_delivery/features/home/presentation/cubits/category_state.dart';
import 'package:food_delivery/features/home/presentation/cubits/product_cubits.dart';
import 'package:food_delivery/features/home/presentation/cubits/product_state.dart';
import 'package:food_delivery/features/home/presentation/pages/view_all_page.dart';
import 'package:food_delivery/theme/my_color.dart';
import 'package:food_delivery/widgets/home/product_item.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:popover/popover.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categoryRepo = CategoryRepoFirestore();
  final productRepo = ProductRepoFirestore();
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubits>().currentUser;
    final favoriteRepo = FavoriteRepoFirestore(user!);
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  CategoryCubits(categoryRepo: categoryRepo)..getListCategory(),
        ),
        BlocProvider(
          create: (context) => ProductCubits(productRepo: productRepo),
        ),
        BlocProvider(
          create: (context) => FavoriteCubits(favoriteRepo)..getFavoriteList(),
        ),
      ],
      child: BlocConsumer<CategoryCubits, CategoryState>(
        builder: (ctx, state) {
          if (state is CateSuccess) {
            final listCategory = state.listCategories;
            selectedCategory ??= listCategory.first.name;
            ctx.read<ProductCubits>().getProductByCate(selectedCategory!);
            return Scaffold(
              appBar: homeAppbar(context),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        homeBanner(context),
                        const SizedBox(height: 25),
                        Text(
                          'Categories',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ),
                  homeCategory(listCategory),
                  const SizedBox(height: 25),
                  homeViewAll(context),
                  const SizedBox(height: 20),
                  homeProduct(listCategory, size),
                ],
              ),
            );
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
        listener: (context, state) {
          if (state is CateError) {
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

  AppBar homeAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        const SizedBox(width: 24),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.menu_copy, size: 18),
          ),
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DELIVER TO',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
                color: MyColor.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Halal Lab office',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color(0xFF676767),
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
        const Spacer(),
        Builder(
          builder:
              (appnarContext) => GestureDetector(
                onTap: () {
                  showPopover(
                    radius: 20,
                    backgroundColor: Colors.blueGrey[100]!,
                    height: 105,
                    width: 180,
                    context: appnarContext,
                    bodyBuilder: (ctx) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              context.read<AuthCubits>().logOut();
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                              ),
                              child: Center(
                                child: Text(
                                  'Log Out',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[100],
                            ),
                            child: Center(
                              child: Text(
                                'Edit Profile',
                                style: Theme.of(
                                  context,
                                ).textTheme.titleMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/profile.png', width: 23),
                ),
              ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }

  Expanded homeProduct(List<CategoryModel> listCategory, Size size) {
    return Expanded(
      child: BlocBuilder<FavoriteCubits, FavoriteState>(
        builder: (context, favState) {
          if (favState is FavoLoaded || favState is FavoSuccess) {
            return BlocConsumer<ProductCubits, ProductState>(
              builder: (context, state) {
                if (state is ProductSuccess) {
                  final listProduct = state.listProducts;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: listProduct.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: index == listProduct.length - 1 ? 15 : 0,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: ProductItem(product: listProduct[index]),
                        ),
                      );
                    },
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
              listener: (context, state) {
                if (state is ProductError) {
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
            );
          }
          return const Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }

  Padding homeViewAll(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Text('Popular Now', style: Theme.of(context).textTheme.headlineLarge),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (ctx) => BlocProvider(
                        create:
                            (_) =>
                                ProductCubits(productRepo: productRepo)
                                  ..getProduct(),
                        child: const ViewAllPage(),
                      ),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  'View All',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: MyColor.orange),
                ),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: MyColor.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    size: 10,
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox homeCategory(List<CategoryModel> listCategory) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: index == listCategory.length - 1 ? 15 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                if (selectedCategory == listCategory[index].name) {
                  return;
                }
                setState(() {
                  selectedCategory = listCategory[index].name;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:
                      selectedCategory == listCategory[index].name
                          ? MyColor.primary
                          : MyColor.secondaryBackground,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            selectedCategory == listCategory[index].name
                                ? Colors.white
                                : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        imageUrl: listCategory[index].image,
                        placeholder:
                            (context, url) => const CircularProgressIndicator(),
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      listCategory[index].name,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge!.copyWith(
                        fontSize: 16,
                        color:
                            selectedCategory == listCategory[index].name
                                ? MyColor.headerTextColor
                                : MyColor.darkText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container homeBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 0),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFCC),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(fontSize: 20),
                    children: [
                      const TextSpan(text: 'The Fasted In Delivery '),
                      const TextSpan(
                        text: 'Food',
                        style: TextStyle(color: MyColor.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 9,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: MyColor.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Order Now',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: MyColor.subText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/shipper.png'),
        ],
      ),
    );
  }
}
