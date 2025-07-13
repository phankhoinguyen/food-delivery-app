import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_delivery/core/constants/api_constants.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/add_address/add_address_bloc.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/add_address/add_address_event.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/add_address/add_address_state.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/address_page/address_page_cubits.dart';
import 'package:food_delivery/features/setting/address/presentation/widgets/label_address.dart';
import 'package:food_delivery/features/setting/profile/presentation/widgets/info_field.dart';
import 'package:food_delivery/features/setting/profile/presentation/widgets/info_label.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:logger/logger.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key, this.selectedPlace});
  final PlacePrediction? selectedPlace;

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final logger = Logger();
  final _controller = TextEditingController();
  final _desController = TextEditingController();
  final _focusNode = FocusNode();
  final _desFocusNode = FocusNode();
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final place = widget.selectedPlace;
    if (place != null) {
      context.read<AddAddressBloc>().add(AddressInitFronEditEvent(place));
      _controller.text = place.displayName;
      secondaryAddress = place.formattedAddress;
      _currentIndex = AddressType.values.firstWhere(
        (type) => type.name == place.type,
      );
      _desController.text = place.description ?? '';
      lat = place.lat;
      long = place.long;
      isDefault = place.isDefault!;
      isButtonEnable = true;
    }
    super.initState();
  }

  String? lat;
  String? long;
  String? secondaryAddress;
  AddressType? _currentIndex;
  bool isDefault = false;
  bool isButtonEnable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: BlocConsumer<AddAddressBloc, AddressState>(
          listener: (context, state) {
            if (state is UpdateAddressSucceeded) {
              context.read<AddressPageCubits>().getListAddress();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is AddressPlaceSelected) {
              lat = state.selectedLatitude;
              long = state.selectedLongitude;
              secondaryAddress = state.selectedPlace.formattedAddress;
            }
            if (state is ChoosenLabel) {
              _currentIndex = state.currentType;
            }
            if (state is CurrentAddressLoaded) {
              lat = state.place.lat;
              long = state.place.long;
              secondaryAddress = state.place.formattedAddress;
              _controller.text = state.place.displayName;
            }

            isButtonEnable =
                context.watch<AddAddressBloc>().isSaveButtonEnable();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeAheadField<PlacePrediction>(
                    controller: _controller,
                    focusNode: _focusNode,
                    builder: (context, _, _) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            hintText: 'Enter a location',
                            prefixIcon: const Icon(Icons.location_on),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _controller.clear();
                                context.read<AddAddressBloc>().add(
                                  const ClearSearchEvent(),
                                );
                              },
                              icon: const Icon(Icons.clear),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      );
                    },
                    itemBuilder: (context, value) {
                      return ListTile(
                        leading: const Icon(Icons.location_on),
                        title: Text(value.displayName),
                        subtitle: Text(value.formattedAddress),
                      );
                    },
                    onSelected: (value) {
                      _controller.text = value.displayName;
                      context.read<AddAddressBloc>().add(
                        SelectPlaceEvent(place: value),
                      );

                      _focusNode.unfocus();
                      // _controller.text = value.displayName;
                    },
                    suggestionsCallback: (search) {
                      if (search.isNotEmpty || search != _controller.text) {
                        context.read<AddAddressBloc>().add(
                          SearchPlacesEvent(query: search),
                        );
                      }
                      if (state is AddressSearchLoaded) {
                        return state.predictions;
                      }
                      return <PlacePrediction>[];
                    },
                  ),
                  const SizedBox(height: 10),

                  // Get current location
                  GestureDetector(
                    onTap:
                        (state is CurrentAddressLoading)
                            ? null
                            : () {
                              context.read<AddAddressBloc>().add(
                                PressCurrentLocationEvent(),
                              );
                            },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: BlocBuilder<AddAddressBloc, AddressState>(
                        builder: (context, state) {
                          if (state is CurrentAddressLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/navigation.png',
                                height: 15,
                                width: 15,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Use my current location',
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),

                  const InfoLabel(text: 'Detail'),
                  const SizedBox(height: 5),
                  InfoField(text: secondaryAddress ?? ''),
                  const InfoLabel(text: 'Description'),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 231, 239),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      focusNode: _desFocusNode,
                      onTapOutside: (event) => _desFocusNode.unfocus(),
                      controller: _desController,
                      maxLines: 2,
                      maxLength: 73,
                      decoration: const InputDecoration(
                        hintText: 'Street, Apartment...',
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      onChanged: (value) {
                        context.read<AddAddressBloc>().add(
                          TypeDescriptionEvent(value),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const InfoLabel(text: 'Label as'),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LabelAddress(
                        isActive: _currentIndex == AddressType.home,
                        label: 'Home',
                        type: AddressType.home,
                      ),
                      LabelAddress(
                        isActive: _currentIndex == AddressType.office,
                        label: 'Office',
                        type: AddressType.office,
                      ),
                      LabelAddress(
                        isActive: _currentIndex == AddressType.others,
                        label: 'Others',
                        type: AddressType.others,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const InfoLabel(text: 'Set as Default'),
                      const Spacer(),
                      Switch(
                        activeColor: MyColor.primary,
                        value: isDefault,
                        onChanged: (value) {
                          context.read<AddAddressBloc>().add(
                            ActiveDefault(value),
                          );
                          setState(() {
                            isDefault = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      height: 150,
                      width: double.infinity,
                      child: Image.network(
                        ApiConstants.buildMapUrl(
                          lat ?? ApiConstants.defaultLat.toString(),
                          long ?? ApiConstants.defaultLng.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child:
                        (widget.selectedPlace != null)
                            ? ElevatedButton(
                              onPressed: () async {
                                context.read<AddAddressBloc>().add(
                                  PressUpdateButtonEvent(widget.selectedPlace!),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColor.primary,
                              ),
                              child: Text(
                                'Update Address',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                            : ElevatedButton(
                              onPressed:
                                  isButtonEnable
                                      ? () {
                                        context.read<AddAddressBloc>().add(
                                          PressSaveButtonEvent(),
                                        );
                                        context
                                            .read<AddressPageCubits>()
                                            .getListAddress();
                                        Navigator.pop(context);
                                      }
                                      : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColor.primary,
                              ),
                              child: Text(
                                'Save Address',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
