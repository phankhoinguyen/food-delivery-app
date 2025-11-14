import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/widgets/my_buton.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_redirect.dart';
import 'package:food_delivery/features/payment/presentation/check-status/bloc/payment_status_bloc.dart';
import 'package:food_delivery/features/payment/presentation/check-status/bloc/payment_status_event.dart';
import 'package:food_delivery/features/payment/presentation/check-status/bloc/payment_status_state.dart';
import 'package:food_delivery/features/payment/presentation/check-status/components/failed_status_widget.dart';
import 'package:food_delivery/features/payment/presentation/check-status/components/success_status_widget.dart';

class PaymentStatusPage extends StatefulWidget {
  const PaymentStatusPage({super.key, this.order, this.codAmount});
  final PaymentRedirect? order;
  final String? codAmount;

  @override
  State<PaymentStatusPage> createState() => _PaymentStatusPageState();
}

class _PaymentStatusPageState extends State<PaymentStatusPage> {
  @override
  void initState() {
    if (widget.order != null) {
      context.read<PaymentStatusBloc>().add(
        InitializeStatus(widget.order!.orderId),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<PaymentStatusBloc>();
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          BlocConsumer<PaymentStatusBloc, PaymentStatusState>(
            builder: (context, state) {
              if (state.success == true) {
                return SuccessStatusWidget(
                  order: widget.order,
                  codAmount: widget.codAmount,
                );
              } else if (state.success == false) {
                return const FailedStatusWidget();
              }
              return const Center(child: CircularProgressIndicator());
            },
            listener: (context, state) {},
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 380,
        child: MyButon(
          text: 'Back To Home',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
