import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';

class MockPaymentData {
  static List<CartModel> getMockCartItems() {
    return [
      CartModel(
        id: '1',
        name: 'Beef Burger',
        quantity: 1,
        price: 7.59,
        imgUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1899&q=80',
      ),
      CartModel(
        id: '2',
        name: 'Double Burger',
        quantity: 1,
        price: 10.0,
        imgUrl:
            'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1760&q=80',
      ),
      CartModel(
        id: '3',
        name: 'Cheese Burger',
        quantity: 1,
        price: 8.88,
        imgUrl:
            'https://images.unsplash.com/photo-1550317138-10000687a72b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
      ),
    ];
  }
}
