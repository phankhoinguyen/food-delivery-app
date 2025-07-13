import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_event.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_state.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.paymentMethod,
    required this.isLinked,
  });
  final PaymentMethod paymentMethod;
  final bool isLinked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        final isMethodLinked =
            state.linkedPaymentMethods[paymentMethod.type] ?? isLinked;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Image.asset(paymentMethod.imgUrl, height: 20, width: 20),
              const SizedBox(width: 10),
              Text(paymentMethod.title),
              const Spacer(),
              if (isMethodLinked)
                Radio<PaymentType>(
                  value: paymentMethod.type,
                  groupValue: state.selectedPaymentMethod,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<PaymentBloc>().add(
                        SelectPaymentMethod(value),
                      );
                    }
                  },
                )
              else
                GestureDetector(
                  onTap: () {
                    context.read<PaymentBloc>().add(
                      LinkPaymentMethod(paymentMethod.type),
                    );
                  },
                  child: Text(
                    'Link now',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: MyColor.myBlue,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
