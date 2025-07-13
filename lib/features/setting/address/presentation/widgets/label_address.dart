import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/add_address/add_address_bloc.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/add_address/add_address_event.dart';

class LabelAddress extends StatefulWidget {
  const LabelAddress({
    super.key,
    required this.isActive,
    required this.label,
    required this.type,
  });
  final bool isActive;
  final AddressType type;
  final String label;
  @override
  State<LabelAddress> createState() => _LabelAddressState();
}

class _LabelAddressState extends State<LabelAddress> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<AddAddressBloc>().add(ChooseLabelEvent(widget.type));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            widget.isActive
                ? MyColor.primary
                : const Color.fromARGB(255, 224, 231, 239),
      ),
      child: Text(
        widget.label,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: widget.isActive ? Colors.white : MyColor.darkBackground,
        ),
      ),
    );
  }
}
