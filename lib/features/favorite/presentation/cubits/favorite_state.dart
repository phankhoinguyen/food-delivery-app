import 'package:food_delivery/features/favorite/domain/entities/favorite_model.dart';

abstract class FavoriteState {}

class FavoInitial extends FavoriteState {}

class FavoLoading extends FavoriteState {}

class FavoSuccess extends FavoriteState {}

class FavoLoaded extends FavoriteState {
  final List<FavoriteModel> listItem;
  FavoLoaded(this.listItem);
}

class FavoError extends FavoriteState {
  final String msg;
  FavoError(this.msg);
}
