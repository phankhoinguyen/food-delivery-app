# MoMo Payment Integration

This documentation explains how the MoMo payment API integration works in the Food Delivery app.

## API Integration

The app now integrates with the MoMo payment API at `http://localhost:3000/api/payment/momo`.

### Request Format
```json
{
  "orderId": "abc123",
  "amount": 20000,
  "paymentMethod": "momo"
}
```

### Response Format
```json
{
  "success": true,
  "message": "MoMo payment initiated",
  "data": {
    "paymentId": "KEq2BjSRJX9MtHFfo9zk",
    "provider": "momo",
    "status": "pending",
    "requestId": "1Z24b776-4169-42d4-8fee-fcf007e1290",
    "transactionId": null,
    "deepLink": "momo://app?action=payWithApp&isSScanQR=false&serviceType=app&sid=TU9NTSwudObgzMjOgMyOTI2LTQ3NzJiZkv5.0",
    "qrCodeUrl": "momo://app?action=payWithApp&isSScanQR=true&serviceType=app&sid=TU9NTSwudObgzMjOgMyOTI2LTQ3NzJiZkv5.0",
    "smartUrl": null
  }
}
```

## Implementation Details

### Files Created/Modified

1. **PaymentService** (`lib/features/payment/data/services/payment_service.dart`)
   - Handles HTTP requests to MoMo and VNPay APIs
   - Supports both MoMo and VNPay payment methods
   - Includes error handling

2. **PaymentRequest** (`lib/features/payment/domain/entities/payment_request.dart`)
   - Data model for payment requests
   - Contains orderId, amount, and paymentMethod

3. **PaymentResponse** (`lib/features/payment/domain/entities/payment_response.dart`)
   - Data model for payment responses
   - Includes success status, message, and payment data

4. **Updated PaymentBloc** (`lib/features/payment/presentation/bloc/payment_bloc.dart`)
   - Modified `_onProcessPayment` to call actual API
   - Handles API responses and errors
   - Updates state with payment results

5. **Updated PaymentPage** (`lib/features/payment/presentation/pages/payment_page.dart`)
   - Generates unique order IDs using UUID
   - Passes payment parameters to bloc
   - Shows success/error dialogs based on payment results

## Usage

1. **Select Payment Method**: User selects MoMo as payment method
2. **Click Pay Now**: Generates order ID and calls payment API
3. **API Processing**: App sends request to MoMo API endpoint
4. **Handle Response**: Shows success dialog with payment details or error message
5. **Payment Completion**: User can use deep links or QR codes to complete payment in MoMo app

## Configuration

Make sure your backend server is running on `http://localhost:3000` with the following endpoints:
- `/api/payment/momo` - for MoMo payments
- `/api/payment/vnpay` - for VNPay payments

## Error Handling

The app handles various error scenarios:
- Network connectivity issues
- API server errors
- Invalid payment data
- Payment processing failures

All errors are displayed to the user through error dialogs with descriptive messages.

## Testing

To test the integration:
1. Start your backend server
2. Run the Flutter app
3. Add items to cart
4. Go to payment page
5. Select MoMo payment method
6. Click "Pay Now"
7. Verify the API request is sent and response is handled

The app will display the payment response details in a success dialog, including deep links for completing the payment in the MoMo app.
