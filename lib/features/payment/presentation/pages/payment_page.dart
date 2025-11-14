import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/constants/helper.dart';
import 'package:food_delivery/core/injection/injection.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery/features/payment/data/cod_method.dart';
import 'package:food_delivery/features/payment/data/momo_method.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_redirect.dart';
import 'package:food_delivery/features/payment/domain/repo/payment_repo.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_event.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_state.dart';
import 'package:food_delivery/features/payment/presentation/check-status/bloc/payment_status_bloc.dart';
import 'package:food_delivery/features/payment/presentation/check-status/pages/payment_status_page.dart';
import 'package:food_delivery/features/payment/presentation/widgets/payment_method_widget.dart';
import 'package:food_delivery/features/payment/presentation/widgets/payment_product.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    super.key,
    required this.listProduct,
    required this.address,
  });

  final List<CartModel> listProduct;
  final String address;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              PaymentBloc(paymentRepo: getIt<PaymentRepo>())
                ..add(PaymentInitialized(cartItems: listProduct)),
      child: _PaymentPageContent(listProduct: listProduct, address: address),
    );
  }
}

class _PaymentPageContent extends StatefulWidget {
  const _PaymentPageContent({required this.listProduct, required this.address});

  final List<CartModel> listProduct;
  final String address;

  @override
  State<_PaymentPageContent> createState() => _PaymentPageContentState();
}

class _PaymentPageContentState extends State<_PaymentPageContent> {
  StreamSubscription? sub;
  @override
  void initState() {
    final appLinks = AppLinks();
    sub = appLinks.uriLinkStream.listen((link) {
      final orderId = link.queryParameters['orderId'];
      final amount = link.queryParameters['amount'];
      final responseTime = int.parse(link.queryParameters['responseTime']!);
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(responseTime).toLocal();
      String dayFormat = DateFormat('dd/MM/yyyy').format(dateTime);
      String hoursFormat = DateFormat('HH:mm:ss').format(dateTime);
      context.read<CartBloc>().add(GetCartList());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => PaymentStatusBloc(getIt<PaymentRepo>()),
                child: PaymentStatusPage(
                  order: PaymentRedirect(
                    dayTime: dayFormat,
                    hoursTime: hoursFormat,
                    orderId: orderId!,
                    amount: amount!,
                  ),
                ),
              ),
        ),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.address);
    const uuid = Uuid();
    final orderId = uuid.v4().substring(0, 8);
    final size = MediaQuery.of(context).size;

    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state.paymentResponse?.data?.paymentId == 'cod_payment') {
          final amount = state.total;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentStatusPage(codAmount: amount.toVND()),
            ),
          );
        } else if (state.errorMessage != null) {}
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
                            height: widget.listProduct.length * 90,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.listProduct.length,
                              itemBuilder:
                                  (context, index) => PaymentProduct(
                                    item: widget.listProduct[index],
                                  ),
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
                              Text(state.totalFood.toVND()),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Shipping cost'),
                              const Spacer(),
                              Text(state.shippingCost.toVND()),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Total'),
                              const Spacer(),
                              Text(state.total.toVND()),
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
                              'Total (${widget.listProduct.length} products)',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              '${state.total.toVND()} đ',
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
                                      // Convert PaymentType to string
                                      String paymentMethodString =
                                          state.selectedPaymentMethod!.name;

                                      context.read<PaymentBloc>().add(
                                        ProcessPayment(
                                          orderId: orderId,
                                          address: widget.address,
                                          amount: state.total,
                                          paymentMethod: paymentMethodString,
                                          items: widget.listProduct,
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
