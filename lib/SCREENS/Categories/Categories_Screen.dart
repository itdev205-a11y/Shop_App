import 'package:flutter/material.dart';

import 'Accessories/Accessories_Screen.dart';
import 'Fashion/FashionScreen.dart';
import 'SHOES/Shoes_Screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GridProducts> categories = [

      const GridProducts(
        name: 'Shoes',
        image: 'assets/images/2.jpg',
        page: ShoesScreen(),
      ),

      const GridProducts(
        name: 'Fashion',
        image: 'assets/images/1.jpg',
        page: FashionScreen(),
      ),

      const GridProducts(
        name: 'Accessories',
        image: 'assets/Accessories/Accessories.jpg',
        page: AccessoriesScreen(),
      ),






    ];

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: const Text(
          "Categories",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),

        child: GridView.builder(
          itemCount: categories.length,

          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: .78,
          ),

          itemBuilder: (context, index) {
            final item = categories[index];

            return GestureDetector(

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => item.page,
                  ),
                );
              },

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(26),

                  boxShadow: [
                    BoxShadow(
                      color:
                      Colors.black.withOpacity(.05),
                      blurRadius: 20,
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(
                          top: Radius.circular(26),
                        ),

                        child: Image.asset(
                          item.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      item.name,

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GridProducts {
  final String name;
  final String image;
  final Widget page;

  const GridProducts({
    required this.name,
    required this.image,
    required this.page,
  });
}