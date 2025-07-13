import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';

abstract class AddressPageState {}

class AddressPageInitial extends AddressPageState {}

class AddressPageLoading extends AddressPageState {}

class AddressPageLoaded extends AddressPageState {
  final List<PlacePrediction> listPlace;
  AddressPageLoaded(this.listPlace);
}

class AddressChoosen extends AddressPageState {
  final PlacePrediction place;
  AddressChoosen(this.place);
}
