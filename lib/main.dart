




import 'package:flutter/material.dart';

import 'Go_Router.dart';


  void main() {
    runApp(const App());
  }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
