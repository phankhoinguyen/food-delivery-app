import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/payment/data/cod_method.dart';
import 'package:food_delivery/features/payment/data/momo_method.dart';
import 'package:food_delivery/features/payment/data/repo/payment_repo_impl.dart';
import 'package:food_delivery/features/payment/data/vnpay_method.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_event.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_state.dart';
import 'package:food_delivery/features/payment/presentation/widgets/payment_method_widget.dart';
import 'package:food_delivery/features/payment/presentation/widgets/payment_product.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.listProduct});

  final List<CartModel> listProduct;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              PaymentBloc(paymentRepo: PaymentRepoImpl())
                ..add(PaymentInitialized(cartItems: listProduct)),
      child: _PaymentPageContent(listProduct: listProduct),
    );
  }
}

class _PaymentPageContent extends StatelessWidget {
  const _PaymentPageContent({required this.listProduct});

  final List<CartModel> listProduct;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColor.imageBackground,
            title: const Text('Orders'),
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: MyColor.imageBackground),
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
                                isLinked: false,
                              ),
                              PaymentMethodWidget(
                                paymentMethod: VNPayPayment(),
                                isLinked: false,
                              ),
                              PaymentMethodWidget(
                                paymentMethod: CashOnDeliveryPayment(),
                                isLinked: true,
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
                                    context.read<PaymentBloc>().add(
                                      const ProcessPayment(),
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
    );
  }
}
