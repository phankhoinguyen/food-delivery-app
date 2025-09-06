import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_event.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_state.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key, required this.paymentMethod});
  final PaymentMethod paymentMethod;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Image.asset(paymentMethod.imgUrl, height: 20, width: 20),
              const SizedBox(width: 10),
              Text(paymentMethod.title),
              const Spacer(),
              Radio<PaymentType>(
                value: paymentMethod.type,
                groupValue: state.selectedPaymentMethod,
                onChanged: (value) {
                  if (value != null) {
                    context.read<PaymentBloc>().add(SelectPaymentMethod(value));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
