enum AddressCategory { home, offfice, others }

class AddressModel {
  final String address;
  final AddressCategory category;

  AddressModel({required this.address, required this.category});
}
