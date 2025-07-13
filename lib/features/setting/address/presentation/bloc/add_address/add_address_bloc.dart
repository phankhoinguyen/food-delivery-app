import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';
import 'package:food_delivery/features/setting/address/domain/repo/add_address_repo.dart';
import 'package:logger/logger.dart';

import 'add_address_event.dart';
import 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddressEvent, AddressState> {
  final logger = Logger();
  final AddressRepo addressRepository;
  AddressType? labelType;
  String? address;
  PlacePrediction place = const PlacePrediction(
    placeId: '',
    displayName: '',
    formattedAddress: '',
    uid: '',
  );
  // Timer để debounce search

  AddAddressBloc({required this.addressRepository})
    : labelType = null,
      address = null,
      super(const AddressInitial()) {
    on<SearchPlacesEvent>(_onSearchPlaces);
    on<SelectPlaceEvent>(_onSelectPlace);
    on<ClearSearchEvent>(_onClearSearch);
    on<ChooseLabelEvent>(_onChooseLabel);
    on<ActiveDefault>(_onActiveDefault);
    on<PressSaveButtonEvent>(_onPressSaveButton);
    on<PressUpdateButtonEvent>(_onPressUpdateButton);
    on<PressCurrentLocationEvent>(_onPressCurrentLocation);
    on<AddressInitFronEditEvent>(_onAddressInitFronEditEvent);
    on<TypeDescriptionEvent>(_onTypeDescriptionEvent);
  }

  Future<void> _onSearchPlaces(
    SearchPlacesEvent event,
    Emitter<AddressState> emit,
  ) async {
    if (event.query.trim().isEmpty) {
      emit(const AddressInitial());
      return;
    }

    emit(const AddressSearchLoading());
    final result = await addressRepository.searchPlaces(query: event.query);
    result.fold((failure) => emit(const AddressError(message: '')), (
      predictions,
    ) {
      address = '';
      emit(AddressSearchLoaded(predictions: predictions, query: event.query));
    });
  }

  Future<void> _onSelectPlace(
    SelectPlaceEvent event,
    Emitter<AddressState> emit,
  ) async {
    final currentState = state;

    if (currentState is AddressSearchLoaded) {
      emit(AddressDetailsLoading());
      place = place.copyWith(
        placeId: event.place.placeId,
        displayName: event.place.displayName,
        formattedAddress: event.place.formattedAddress,
      );

      final result = await addressRepository.getPlaceDetails(
        placeId: event.place.placeId,
      );
      result.fold((failure) => emit(const AddressError(message: '')), (map) {
        final lat = map['lat'];
        final long = map['long'];
        final placeWithLatLng = place.copyWith(
          lat: lat.toString(),
          long: long.toString(),
        );
        place = placeWithLatLng;
        address = placeWithLatLng.formattedAddress;

        emit(
          AddressPlaceSelected(
            selectedPlace: placeWithLatLng,
            predictions: currentState.predictions,
            query: currentState.query,
          ),
        );
      });
    }
  }

  void _onClearSearch(ClearSearchEvent event, Emitter<AddressState> emit) {
    emit(const AddressInitial());
  }

  void _onChooseLabel(ChooseLabelEvent event, Emitter<AddressState> emit) {
    labelType = event.type;
    place = place.copyWith(type: labelType!.name);
    emit(ChoosenLabel(event.type));
  }

  bool isSaveButtonEnable() {
    return labelType != null && address != null && address!.isNotEmpty;
  }

  void _onTypeDescriptionEvent(
    TypeDescriptionEvent event,
    Emitter<AddressState> emit,
  ) {
    place = place.copyWith(description: event.des);
    logger.w(place);
  }

  void _onActiveDefault(ActiveDefault event, Emitter<AddressState> emit) {
    place = place.copyWith(isDefault: event.isDefault);
  }

  void _onPressSaveButton(
    PressSaveButtonEvent event,
    Emitter<AddressState> emit,
  ) async {
    try {
      place = place.copyWith(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      final result = await addressRepository.saveAddress(place: place);
      result.fold((l) => emit(const AddressError(message: '')), (r) {
        emit(AddressSaved(place));
      });
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }

  void _onPressUpdateButton(
    PressUpdateButtonEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressDetailsLoading());
    try {
      place = place.copyWith(updatedAt: DateTime.now());
      final result = await addressRepository.updateAddress(place: place);
      logger.w(result);
      result.fold((l) => emit(const AddressError(message: '')), (r) {
        emit(UpdateAddressSucceeded());
      });
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }

  void _onAddressInitFronEditEvent(
    AddressInitFronEditEvent event,
    Emitter<AddressState> emit,
  ) async {
    place = event.selectPlace;
    logger.w('init : $place');
  }

  void _onPressCurrentLocation(
    PressCurrentLocationEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(CurrentAddressLoading());
    try {
      final result = await addressRepository.getCurrentLotion();
      result.fold((l) => emit(AddressError.failure(failure: l)), (p) {
        address = p.formattedAddress;
        place = p;
        emit(CurrentAddressLoaded(p));
      });
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }
}
