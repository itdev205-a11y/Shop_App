import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store_app/Screens.dart';

import 'Providers/CartProvider.dart';
import 'Providers/Provider_Favourite.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: const Screens(),

    );

  }

}