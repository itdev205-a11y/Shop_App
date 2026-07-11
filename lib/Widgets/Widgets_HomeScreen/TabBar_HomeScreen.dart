import 'package:flutter/material.dart';
import '../../Screens/CategoryProductsScreen.dart';


class TabbarHomescreen extends StatefulWidget {
  const TabbarHomescreen({super.key});

  @override
  State<TabbarHomescreen> createState() => _TabbarHomescreenState();
}


class _TabbarHomescreenState extends State<TabbarHomescreen> {
  int selectedIndex = 0;


  final List<String> tabs = [
    'Popular',
    'Man',
    'Bags',
    'Clothes'



  ];


  final List<Widget> pages = [

    const CategoryProductsScreen(
      category: 'Popular',
    ),

    const CategoryProductsScreen(
      category: 'Man',
    ),
    const CategoryProductsScreen(
      category: 'Bags',
    ),
    const CategoryProductsScreen(
      category: 'Clothes',
    ),


  ];


  @override
  Widget build(BuildContext context) {

    return Stack(

      children: [

        // المحتوى القابل للتمرير خلف التاب
        Padding(
          padding: const EdgeInsets.only(top: 60),

          child: SingleChildScrollView(

            child: pages[selectedIndex],

          ),
        ),



         SingleChildScrollView(

            scrollDirection: Axis.horizontal,

            child: Row(

              children: List.generate(

                tabs.length,

                    (index) => Padding(

                  padding:
                  const EdgeInsets.only(right: 10),

                  child: _buildTab(

                    text: tabs[index],

                    isSelected:
                    selectedIndex == index,

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

      duration:
      const Duration(milliseconds: 250),


      padding:
      const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 12,
      ),


      decoration: BoxDecoration(

        color: isSelected
            ? Colors.black
            : Colors.grey.shade200,


        borderRadius:
        BorderRadius.circular(30),

      ),


      child: Text(

        text,


        style: TextStyle(

          color: isSelected
              ? Colors.white
              : Colors.black,


          fontWeight:
          FontWeight.w600,

        ),

      ),

    ),

  );
}