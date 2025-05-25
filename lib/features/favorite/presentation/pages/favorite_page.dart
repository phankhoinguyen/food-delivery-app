import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/favorite/data/favorite_repo_firestore.dart';
import 'package:food_delivery/features/favorite/presentation/cubits/favorite_cubits.dart';
import 'package:food_delivery/features/favorite/presentation/cubits/favorite_state.dart';
import 'package:food_delivery/widgets/favorite/favorite_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubits>().currentUser;
    final favoriteRepo = FavoriteRepoFirestore(user!);
    return BlocProvider(
      create: (context) => FavoriteCubits(favoriteRepo)..getFavoriteList(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Your Favorite Foods'),
        ),
        body: BlocConsumer<FavoriteCubits, FavoriteState>(
          builder: (context, state) {
            if (state is FavoLoaded || state is FavoSuccess) {
              final listItem = context.read<FavoriteCubits>().listFavo;
              print('listItem $listItem');
              if (listItem.isEmpty) {
                return const Center(child: Text('No favorite food yet'));
              }
              return ListView.builder(
                itemCount: listItem.length,
                itemBuilder: (context, index) {
                  return FavoriteItem(item: listItem[index]);
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
          listener: (context, state) {
            if (state is FavoError) {
              print(state.msg);
            }
          },
        ),
      ),
    );
  }
}
