import 'package:flutter/material.dart';
import 'package:store_app/Screens_Products/Popular_Screen.dart';

import '../../Screens_Products/Men_Screen.dart';

class TabbarHomescreen extends StatefulWidget {
  const TabbarHomescreen({super.key});

  @override
  State<TabbarHomescreen> createState() => _TabbarHomescreenState();
}

class _TabbarHomescreenState extends State<TabbarHomescreen> {

  final List<String> tabs = [

    'popular',
    'Man',
    'Electronics',
  ];

  int selectedIndex = 0;

  final List<Widget> pages = const [

    PopularScreen(),
    MenScreen(),
    Center(child: Text('Electronics')),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              tabs.length,
                  (index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: _buildTab(
                  text: tabs[index],
                  isSelected: selectedIndex == index,
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        pages[selectedIndex],
      ],
    );
  }
}

Widget _buildTab({
  required String text,
  required bool isSelected,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}