import 'package:flutter/material.dart';
import 'package:hotel_menu_app/model/item.dart';
import 'package:hotel_menu_app/providers/item_provider.dart';
import 'package:hotel_menu_app/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(allItems),
      child: MaterialApp(
        home: SplashPage(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: SafeArea(child: child!));
        },
      ),
    );
  }
}
