import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';
import 'package:food_delivery/features/setting/address/domain/repo/address_page_repo.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/address_page/address_page_state.dart';
import 'package:food_delivery/features/setting/address/presentation/pages/address_page.dart';

class AddressPageCubits extends Cubit<AddressPageState> {
  final AddressPageRepo addressrepo;
  AddressPageCubits({required this.addressrepo}) : super(AddressPageInitial());

  Future<List<PlacePrediction>> getListAddress() async {
    logger.w('get list');
    emit(AddressPageLoading());
    final list = await addressrepo.getListAddress();
    emit(AddressPageLoaded(list));
    return list;
  }

  void pickAddress(PlacePrediction place) {
    emit(AddressChoosen(place));
  }
}
