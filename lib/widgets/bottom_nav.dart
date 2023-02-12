import 'package:ecommerce/helpers/kcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/providers/bottom_nav/bottom_nav.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavcontroller =
        Provider.of<BottomNavController>(context, listen: false);
    return Consumer<BottomNavController>(builder: (context, value, child) {
      return Scaffold(
        body: value.screens[bottomNavcontroller.index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            // indicatorColor: Colors.black,
            backgroundColor: Colors.white,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            elevation: 0,
            height: 75,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: bottomNavcontroller.index,
            backgroundColor: Colors.white,
            animationDuration: const Duration(),
            onDestinationSelected: (bottomIndex) =>
                bottomNavcontroller.bottomIndex(bottomIndex),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
                label: 'Home',
                selectedIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
                label: 'My Bag',
                selectedIcon: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                  size: 30,
                ),
                label: 'Wishlist',
                selectedIcon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                  size: 30,
                ),
                label: 'Profile',
                selectedIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
