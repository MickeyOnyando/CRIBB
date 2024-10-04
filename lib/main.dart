import 'package:cribb/models/house_shop.dart';
import 'package:cribb/pages/favorites.dart';
import 'package:cribb/pages/homepage.dart';
import 'package:cribb/pages/messages.dart';
import 'package:cribb/pages/profiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HouseShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const HomePage(),
          '/favorites': (context) => const Favorites(),
          '/messages': (context) => const Messages(),
          '/profile': (context) => const Profile(),
        },
      ),
    );
  }
}

 