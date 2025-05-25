import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/home/presentation/cubits/product_cubits.dart';
import 'package:food_delivery/features/home/presentation/cubits/product_state.dart';
import 'package:food_delivery/theme/my_color.dart';
import 'package:food_delivery/widgets/home/product_item.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({super.key});

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.viewAllBackground,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          'All Foods',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocBuilder<ProductCubits, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccess) {
            final listProducts = state.listProducts;
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: listProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8,
                childAspectRatio: 0.59,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return ProductItem(product: listProducts[index]);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
