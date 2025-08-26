import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/features/Home/data/models/bottom_nav_bar_model.dart';
import 'package:archtech/features/Home/presentation/pages/camera.dart';
import 'package:archtech/features/Home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class RecarcherHomeScreen extends StatefulWidget {
  static const String routeName = 'RecarcherHomeScreen/';
  const RecarcherHomeScreen({super.key});

  @override
  State<RecarcherHomeScreen> createState() => _RecarcherHomeScreenState();
}

class _RecarcherHomeScreenState extends State<RecarcherHomeScreen> {
  int _selectedIndex = 0; // Track the currently selected tab

  // List of pages matching BottomNavBarModel.pages
  static const _pages = BottomNavBarModel.recarcherPages;

  void _onItemTapped(int index) {
    // Handle special case for the "Add" tab (index 2)
    if (index == 2) {
      final bool isSubscribed = SessionData.subscriptionsModel?.title != null;
      if (isSubscribed) {
        Navigator.pushNamed(context, Camera.routeName);
      } else {
        context.errorDialog('NoSubscribeMessage');
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
