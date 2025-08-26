import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/svg_constants.dart';

class SettingModel {
  final String title;
  final String icon;
  final String? routeName;
  final Object? args;

  const SettingModel(
      {required this.title, required this.icon, this.routeName, this.args});
  static List<SettingModel> settings = const [
    SettingModel(
        routeName: RouteNames.updateProfile,
        title: 'EditProfile',
        icon: SvgConstantsAssets.assetsSvgEditProfile),
    SettingModel(
        title: 'ChangeLanguage',
        icon: SvgConstantsAssets.assetsSvgLang,
        args: false,
        routeName: RouteNames.localeScreen),

    SettingModel(
        title: 'Privacy',
        icon: SvgConstantsAssets.assetsSvgPrivacy,
        routeName: RouteNames.privacyPolicy),
    // SettingModel(title: 'Support', icon: SvgConstantsAssets.assetsSvgSupport),
    SettingModel(title: 'Logout', icon: SvgConstantsAssets.assetsSvgLogout),
    SettingModel(
        title: 'DeleteAccount', icon: SvgConstantsAssets.assetsSvgLogout),
  ];
}
