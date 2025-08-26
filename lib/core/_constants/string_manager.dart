import 'package:archtech/core/_constants/images_constants.dart';

final class StringManager {
  static const String fontFamily = '';
  static const String appName = 'Archtech';

  static const String tokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';

  static const List<String> googleSignInScopes = <String>[
    'email',
    'profile',
  ];
  static const String applicationJson = 'application/json';
  static const String contentType = 'Content-Type';
  static const String errorKey = 'message';
  static const List<String> types = [
    'Inscriptions',
    'Antiquities',
    'Archaeological Sites',
  ];
  static const String specialRole = 'special';
  static const String userRole = 'user';

  static const List<String> onBoardingTexts = [
    'ancientInscriptions',
    'aiAnalysis',
    'heritageTour'
  ];
  static const List<String> onBoardingImages = [
    ImagesConstantsAsset.assetsImagesSplash1,
    ImagesConstantsAsset.assetsImagesSplash2,
    ImagesConstantsAsset.assetsImagesSplash3,
  ];
  static const inAppPurchaseNotAvailable = 'In-app purchases not available';
  static const productsNotFound = 'Products not found';
  static const subscribeNow = 'Subscribe Now';
  static const cancelSubscription = 'Cancel Subscription';

  // Arabic translations
  static const inAppPurchaseNotAvailableAr =
      'المشتريات داخل التطبيق غير متوفرة';
  static const productsNotFoundAr = 'المنتجات غير موجودة';
  static const subscribeNowAr = 'اشترك الآن';
  static const cancelSubscriptionAr = 'إلغاء الاشتراك';
  static const String somethingWentWrong = 'Something went wrong!';
  static const String onBoardingCacheKey = 'onboarding_completed';
  static const googleClientId =
      '152719487538-8qumllq5eaoj792jbu92ig1d6raft02v.apps.googleusercontent.com';
}
