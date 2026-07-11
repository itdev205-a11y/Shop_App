import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store_app/Screens.dart';

import 'Providers/Provider_Favourite.dart';


void main() {

  runApp(

    ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),

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