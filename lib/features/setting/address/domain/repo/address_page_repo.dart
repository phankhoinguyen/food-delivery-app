import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';

abstract class AddressPageRepo {
  Future<List<PlacePrediction>> getListAddress();
}
