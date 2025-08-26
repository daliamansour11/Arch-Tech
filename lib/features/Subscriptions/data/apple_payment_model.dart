import 'package:json_annotation/json_annotation.dart';
part 'apple_payment_model.g.dart';

@JsonSerializable(createFactory: false)
class ApplePaymentModel {
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'receipt_data')
  final String receiptData;
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @JsonKey(name: 'product_id')
  final String productId;
  @JsonKey(name: 'purchase_date_ms')
  final int purchaseDateMs;
  final String type;

  ApplePaymentModel({
    required this.userId,
    required this.receiptData,
    required this.transactionId,
    required this.productId,
    required this.purchaseDateMs,
    required this.type,
  });

  Map<String, dynamic> toJson() => _$ApplePaymentModelToJson(this);
}
