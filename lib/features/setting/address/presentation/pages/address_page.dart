import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/address_page/address_page_cubits.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/address_page/address_page_state.dart';
import 'package:food_delivery/features/setting/address/presentation/pages/add_address_page.dart';
import 'package:food_delivery/features/setting/address/presentation/widgets/address_tile.dart';
import 'package:logger/logger.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key, this.isCartPage = false});
  final bool isCartPage;

  @override
  State<AddressPage> createState() => _AddressPageState();
}

final logger = Logger();

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    context.read<AddressPageCubits>().getListAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddAddressPage()),
              );
            },
            icon: const Icon(Icons.add_location_alt_outlined),
            iconSize: 30,
          ),
        ],
      ),
      body: BlocBuilder<AddressPageCubits, AddressPageState>(
        builder: (context, state) {
          final List<PlacePrediction> listAddress;
          if (state is AddressPageLoaded) {
            listAddress = state.listPlace.reversed.toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child:
                  listAddress.isNotEmpty
                      ? ListView.builder(
                        itemCount: listAddress.length,
                        itemBuilder:
                            (context, index) => AddressTile(
                              onSelectAddress:
                                  widget.isCartPage
                                      ? () {
                                        context
                                            .read<AddressPageCubits>()
                                            .pickAddress(listAddress[index]);
                                        Navigator.of(context).pop();
                                      }
                                      : null,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => AddAddressPage(
                                          selectedPlace: listAddress[index],
                                        ),
                                  ),
                                );
                              },
                              type: listAddress[index].type!,
                              title: listAddress[index].displayName,
                              address: listAddress[index].formattedAddress,
                              isDefault: listAddress[index].isDefault!,
                            ),
                      )
                      : const Center(child: Text('No address yet')),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
