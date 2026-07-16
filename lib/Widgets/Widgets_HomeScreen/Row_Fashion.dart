import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowFashion extends StatefulWidget {
  const RowFashion({super.key});

  @override
  State<RowFashion> createState() => _RowFashionState();
}

class _RowFashionState extends State<RowFashion> {
  final PageController _controller = PageController(viewportFraction: 0.9);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(

          height: 180,
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              fashionBox(
                "Men's Collection",
                const Color(0xff2563EB),
                const Color(0xff1E3A8A),
              ),

              fashionBox(
                "Women's Fashion",
                const Color(0xffEC4899),
                const Color(0xffBE185D),
              ),

              fashionBox(
                "Kids Collection",
                const Color(0xffF59E0B),
                const Color(0xffD97706),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentPage == index
                    ? Colors.black
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget fashionBox( String title, Color color1, Color color2, )
  { return Container(
    width: 360,
    height: 170,
    margin: const EdgeInsets.symmetric(vertical: 5),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      gradient: LinearGradient(
        colors: [color1, color2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight, ),
      boxShadow: [
        BoxShadow(
          color: color2.withOpacity(0.35),
          blurRadius: 18,
          offset: const Offset(0, 10), ), ], ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ Text( title, style: const TextStyle(
        color: Colors.white, fontSize: 28,
        fontWeight: FontWeight.bold, ), ),
        const SizedBox(height: 10),
        const Text(
          "Discover the latest trends",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16, ), ),
        const Spacer(), ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), ), ),
          child: const Text( "Shop Now", style: TextStyle(
            fontWeight: FontWeight.bold, ), ), ), ], ), ); } }