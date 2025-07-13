import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object?> get props => [];
}

// Event để search places
class SearchPlacesEvent extends AddressEvent {
  final String query;

  const SearchPlacesEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class SelectPlaceEvent extends AddressEvent {
  final PlacePrediction place;

  const SelectPlaceEvent({required this.place});

  @override
  List<Object?> get props => [place];
}

class ClearSearchEvent extends AddressEvent {
  const ClearSearchEvent();
}

class ChooseLabelEvent extends AddressEvent {
  final AddressType type;
  const ChooseLabelEvent(this.type);

  @override
  List<Object?> get props => [type];
}

class TypeDescriptionEvent extends AddressEvent {
  final String des;
  const TypeDescriptionEvent(this.des);
  @override
  List<Object?> get props => [des];
}

class ActiveDefault extends AddressEvent {
  final bool isDefault;
  const ActiveDefault(this.isDefault);
}

class PressSaveButtonEvent extends AddressEvent {}

class PressCurrentLocationEvent extends AddressEvent {}

class PressUpdateButtonEvent extends AddressEvent {
  final PlacePrediction selectPlace;
  PressUpdateButtonEvent(this.selectPlace);
}

class AddressInitFronEditEvent extends AddressEvent {
  final PlacePrediction selectPlace;
  AddressInitFronEditEvent(this.selectPlace);
}

enum AddressType { home, office, others }
