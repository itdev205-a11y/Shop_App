import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'SCREENS/Categories/Categories_Screen.dart';
import 'SCREENS/ProductDetailsScreen.dart';
import 'SCREENS.dart';
import 'SCREENS/LOGIN/Login_Screen.dart';




final GoRouter router = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),








    GoRoute(
      path: '/productDetails',
      pageBuilder: (context, state) {
        final product = state.extra as Product;

        return CustomTransitionPage(
          child: ProductDetailsScreen(product: product),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
        );
      },
    ),








    GoRoute(
      path: '/screens',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const Screens(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.15),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
        );
      },
    ),


    GoRoute(
      path: '/gridProducts',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: CategoriesScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.15),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
        );
      },
    ),














  ],
);

class Product {
  final String image;
  final String name;
  final String price;

  const Product({
    required this.image,
    required this.name,
    required this.price,
  });
}