import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/features/Home/presentation/pages/favorites_page.dart';
import 'package:archtech/features/Home/presentation/pages/google_map.dart';
import 'package:archtech/features/Home/presentation/pages/home_research.dart';
import 'package:archtech/features/Home/presentation/pages/home_screen.dart';
import 'package:archtech/features/Home/presentation/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class BottomNavBarModel {
  BottomNavBarModel._();

  // Pages remain the same
  static const List<Widget> touristPages = [
    MainScreen(),
    MyGoogleMap(
      key: Key('GoogleMap'),
    ),
    SizedBox.shrink(), // Placeholder for "Add" tab
    FavoritesPage(),
    Profile(),
  ];
  static const List<Widget> recarcherPages = [
    HomeResearcher(),
    MyGoogleMap(
      key: Key('GoogleMap'),
    ),
    SizedBox.shrink(), // Placeholder for "Add" tab
    FavoritesPage(),
    Profile(),
  ];

  // Define nav bar items without PersistentBottomNavBarItem
  static List<NavBarItemData> navBarsItems(BuildContext context) {
    return [
      NavBarItemData(
        icon: const VectorGraphic(
          loader: AssetBytesLoader(SvgConstantsAssets.assetsSvgHome),
        ),
        title: context.translate('Home'),
        inactiveIcon: const VectorGraphic(
          loader: AssetBytesLoader(SvgConstantsAssets.assetsSvgHomeOutline),
        ),
      ),
      NavBarItemData(
        icon: const Icon(Icons.location_on, color: ColorManger.primary),
        title: context.translate('Location'),
        inactiveIcon: const VectorGraphic(
          loader: AssetBytesLoader(SvgConstantsAssets.assetsSvgLocation),
        ),
      ),
      NavBarItemData(
        icon: const VectorGraphic(
          colorFilter: ColorFilter.mode(ColorManger.primary, BlendMode.srcIn),
          loader: AssetBytesLoader(SvgConstantsAssets.assetsSvgCamera),
        ),
        title: context.translate('Add'),
        inactiveIcon: const VectorGraphic(
          loader: AssetBytesLoader(SvgConstantsAssets.assetsSvgCamera),
        ),
      ),
      NavBarItemData(
        icon: const Icon(Icons.favorite, color: ColorManger.primary),
        title: context.translate('Favorite'),
        inactiveIcon: const VectorGraphic(
          loader: AssetBytesLoader(SvgConstantsAssets.assetsSvgFavorite),
        ),
      ),
      NavBarItemData(
        icon: const Icon(Icons.person, color: ColorManger.primary),
        title: context.translate('Profile'),
        inactiveIcon: const VectorGraphic(
          loader: AssetBytesLoader(SvgConstantsAssets.assetsSvgPerson),
        ),
      ),
    ];
  }
}

// Helper class to store nav bar item data
class NavBarItemData {
  final Widget icon;
  final String title;
  final Widget? inactiveIcon;

  NavBarItemData({
    required this.icon,
    required this.title,
    this.inactiveIcon,
  });
}
