import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/favorite/domain/entities/favorite_model.dart';
import 'package:food_delivery/features/favorite/domain/repo/favorite_repo.dart';
import 'package:food_delivery/features/favorite/presentation/cubits/favorite_state.dart';

class FavoriteCubits extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;
  FavoriteCubits(this.favoriteRepo) : super(FavoInitial());

  final List<String> _listFavoriteId = [];

  List<FavoriteModel> listFavo = [];
  Future<List<FavoriteModel>> getFavoriteList() async {
    emit(FavoLoading());
    try {
      final listItem = await favoriteRepo.getFavoriteList();
      listFavo = listItem;
      for (var e in listItem) {
        _listFavoriteId.add(e.id);
      }
      emit(FavoLoaded(listItem));
      return listItem;
    } catch (e) {
      emit(FavoError(e.toString()));
      emit(FavoLoaded([]));
      return [];
    }
  }

  Future<void> toogleFavorite(FavoriteModel item) async {
    if (_listFavoriteId.contains(item.id)) {
      _listFavoriteId.remove(item.id);
      listFavo.remove(item);
      emit(FavoSuccess());
      try {
        await favoriteRepo.removeFromList(item);
      } on Exception catch (e) {
        emit(FavoError(e.toString()));
      }
    } else {
      _listFavoriteId.add(item.id);
      listFavo.add(item);
      emit(FavoSuccess());
      try {
        await favoriteRepo.addToList(item);
      } on Exception catch (e) {
        emit(FavoError(e.toString()));
      }
    }
  }

  bool isExist(String itemId) {
    print(_listFavoriteId.contains(itemId));
    return _listFavoriteId.contains(itemId);
  }
}
