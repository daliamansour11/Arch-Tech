import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/features/Home/data/models/bottom_nav_bar_model.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = BottomNavBarModel.navBarsItems(context);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      type: BottomNavigationBarType.fixed, // Ensure all items are visible
      backgroundColor: Colors.white,

      selectedItemColor: ColorManger.primary,
      unselectedItemColor: ColorManger.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      items: List.generate(items.length, (index) {
        final item = items[index];
        return BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Indicator (above the icon)
              if (currentIndex == index)
                Positioned(
                  top: -15, // Adjust position above the icon
                  child: Container(
                    width: 60,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: ColorManger.primary,
                    ),
                  ),
                ),
              // Icon (active or inactive)
              currentIndex == index ? item.icon : item.inactiveIcon!,
            ],
          ),
          label: item.title,
        );
      }),
    );
  }
}
