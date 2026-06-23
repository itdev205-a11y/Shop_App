import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../Go_Router.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> items = [
      const Product(
        image: "assets/images/2.jpg",
        name: "Basic Shoes",
        price: "\$25",
      ),
      const Product(
        image: "assets/images/2.jpg",
        name: "Sport Shoes",
        price: "\$30",
      ),
      const Product(
        image: "assets/images/2.jpg",
        name: "Running Shoes",
        price: "\$40",
      ),
      const Product(
        image: "assets/images/2.jpg",
        name: "Casual Shoes",
        price: "\$28",
      ),
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text("Shoes"),
        centerTitle: true,
        elevation: 0,
      ),


     body:  Padding(
       padding: const EdgeInsets.all(8.0),
       child: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return GestureDetector(
              onTap: () {
                context.push('/productDetails', extra: item);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// IMAGE
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        item.image,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// NAME
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// PRICE
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        item.price,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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