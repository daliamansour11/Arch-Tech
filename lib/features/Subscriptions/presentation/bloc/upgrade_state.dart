import 'package:in_app_purchase/in_app_purchase.dart';

class UpgradeState {
  final List<ProductDetails> products;

  final String? error;
  final bool isLoading;
  final ProductDetails? productDetails;
  final bool isUpgraded;

  const UpgradeState({
    this.products = const [],
    this.isUpgraded = false,
    this.error,
  
    this.productDetails,
    this.isLoading = false,
  });
 

  UpgradeState copyWith(
      {List<ProductDetails>? products,
      String? error,
      bool? isLoading,
    
      bool? isUpgraded,
      ProductDetails? product}) {
    return UpgradeState(
      products: products ?? this.products,
      error: error,
      isUpgraded: isUpgraded ?? this.isUpgraded,
      productDetails: product ?? productDetails,
      isLoading: isLoading ?? false,
    );
  }
}
