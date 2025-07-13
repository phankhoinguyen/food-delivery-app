import 'package:equatable/equatable.dart';
import 'package:food_delivery/core/failure/failure.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/add_address/add_address_event.dart';
import '../../../domain/entities/place_prediction.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object?> get props => [];
}

// Initial state
class AddressInitial extends AddressState {
  const AddressInitial();
}

// Loading state khi đang search places
class AddressSearchLoading extends AddressState {
  const AddressSearchLoading();
}

// State khi có kết quả search
class AddressSearchLoaded extends AddressState {
  final List<PlacePrediction> predictions;
  final String query;

  const AddressSearchLoaded({required this.predictions, required this.query});

  @override
  List<Object?> get props => [predictions, query];
}

// Loading state khi đang get place details
class AddressDetailsLoading extends AddressState {}

class ChoosenLabel extends AddressState {
  final AddressType currentType;
  const ChoosenLabel(this.currentType);
  @override
  List<Object?> get props => [currentType];
}

// State khi đã select một place và có details
class AddressPlaceSelected extends AddressState {
  final PlacePrediction selectedPlace;
  final List<PlacePrediction> predictions; // Giữ lại predictions
  final String query;

  const AddressPlaceSelected({
    required this.selectedPlace,
    required this.predictions,
    required this.query,
  });

  @override
  List<Object?> get props => [selectedPlace, predictions, query];
  // Convenience getters cho GoogleMap
  String get selectedLatitude => selectedPlace.lat!;
  String get selectedLongitude => selectedPlace.long!;
}

// Error state
class AddressError extends AddressState {
  final String? message;
  final Failure? failure;

  const AddressError({required this.message}) : failure = null;

  const AddressError.failure({required this.failure}) : message = null;

  @override
  List<Object?> get props => [message, failure];
}

class AddressSaved extends AddressState {
  final PlacePrediction place;
  const AddressSaved(this.place);
}

class CurrentAddressLoading extends AddressState {}

class CurrentAddressLoaded extends AddressState {
  final PlacePrediction place;
  const CurrentAddressLoaded(this.place);
}

class UpdateAddressSucceeded extends AddressState {}
