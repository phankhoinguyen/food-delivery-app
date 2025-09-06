import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/injection/injection.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/payment/data/cod_method.dart';
import 'package:food_delivery/features/payment/data/momo_method.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_response.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';
import 'package:food_delivery/features/payment/domain/repo/payment_repo.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_event.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_state.dart';
import 'package:food_delivery/features/payment/presentation/widgets/payment_method_widget.dart';
import 'package:food_delivery/features/payment/presentation/widgets/payment_product.dart';
import 'package:uuid/uuid.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.listProduct});

  final List<CartModel> listProduct;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              PaymentBloc(paymentRepo: getIt<PaymentRepo>())
                ..add(PaymentInitialized(cartItems: listProduct)),
      child: _PaymentPageContent(listProduct: listProduct),
    );
  }
}

class _PaymentPageContent extends StatelessWidget {
  const _PaymentPageContent({required this.listProduct});

  final List<CartModel> listProduct;

  void _showPaymentSuccessDialog(
    BuildContext context,
    PaymentResponse response,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Successful!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Your payment has been processed successfully.'),
              const SizedBox(height: 8),
              if (response.data?.paymentId != null)
                Text('Payment ID: ${response.data!.paymentId}'),
              if (response.data?.deepLink != null) ...[
                const SizedBox(height: 8),
                Text('Deep Link: ${response.data!.deepLink}'),
              ],
              if (response.data?.qrCodeUrl != null) ...[
                const SizedBox(height: 8),
                Text('QR Code URL: ${response.data!.qrCodeUrl}'),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to previous page
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPaymentErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Failed'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state.isPaymentSuccessful && state.paymentResponse != null) {
          // Show success dialog or navigate to success page
          _showPaymentSuccessDialog(context, state.paymentResponse!);
        } else if (state.errorMessage != null) {
          // Show error dialog
          _showPaymentErrorDialog(context, state.errorMessage!);
        }
      },
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColor.imageBackground,
              title: const Text('Orders'),
            ),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: MyColor.imageBackground,
                  ),
                  width: double.infinity,
                  height: 900,
                  child: Image.asset(
                    'assets/food_pattern.png',
                    repeat: ImageRepeat.repeatY,
                    color: MyColor.imageBackground2,
                  ),
                ),
                if (state.isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: listProduct.length * 90,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listProduct.length,
                              itemBuilder:
                                  (context, index) =>
                                      PaymentProduct(item: listProduct[index]),
                            ),
                          ),
                          Text(
                            'Order summary',
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Text('Total of food'),
                              const Spacer(),
                              Text(state.totalFood.toStringAsFixed(2)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Shipping cost'),
                              const Spacer(),
                              Text(state.shippingCost.toStringAsFixed(2)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Total'),
                              const Spacer(),
                              Text(state.total.toStringAsFixed(2)),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Payment Methods',
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),

                          SizedBox(
                            height: size.height * .3,
                            child: const Column(
                              children: [
                                PaymentMethodWidget(
                                  paymentMethod: MoMoPayment(),
                                ),
                                PaymentMethodWidget(
                                  paymentMethod: CashOnDeliveryPayment(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total (${listProduct.length} products)',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              state.total.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                state.selectedPaymentMethod != null
                                    ? () {
                                      const uuid = Uuid();
                                      final orderId = uuid.v4();

                                      // Convert PaymentType to string
                                      String paymentMethodString =
                                          state.selectedPaymentMethod!.name;

                                      context.read<PaymentBloc>().add(
                                        ProcessPayment(
                                          orderId: orderId,
                                          amount: state.total,
                                          paymentMethod: paymentMethodString,
                                        ),
                                      );
                                    }
                                    : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColor.primary,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor: Colors.grey,
                            ),
                            child: Text(
                              'Pay Now',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
