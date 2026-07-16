import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Screens/Cart_Screen.dart';
import 'Screens/Favourite_Screen.dart';
import 'Screens/Home_Screen.dart';
import 'Screens/Profile_Screen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  final List<IconData> icons = const [
    Icons.home,
    Icons.favorite_outline,
    Icons.shopping_cart_rounded,
    Icons.person,
  ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),

        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.15, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },

        child: SizedBox(
          key: ValueKey(currentIndex),
          child: pages[currentIndex],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),

        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  isDark ? 0.25 : 0.08,
                ),
                blurRadius: 25,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: CurvedNavigationBar(
            index: currentIndex,
            height: 60,
            backgroundColor: Colors.transparent,
            color: isDark
                ? Colors.grey.shade900
                : Colors.white,
            buttonBackgroundColor:
            isDark ? Colors.white : Colors.black,
            animationDuration:
            const Duration(milliseconds: 250),
            items: List.generate(
              icons.length,
                  (index) => _buildIcon(
                icon: icons[index],
                selected: currentIndex == index,
                isDark: isDark,
              ),
            ),
            onTap: changePage,
          ),
        ),
      ),
    );
  }

  Widget _buildIcon({
    required IconData icon,
    required bool selected,
    required bool isDark,
  }) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 250),
      scale: selected ? 1.15 : 1,
      child: Icon(
        icon,
        size: 28,
        color: selected
            ? (isDark ? Colors.black : Colors.white)
            : Colors.grey,
      ),
    );
  }
}