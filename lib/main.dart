import 'package:cribb/models/house_shop.dart';
import 'package:cribb/models/user.dart';
import 'package:cribb/pages/favorites.dart';
import 'package:cribb/pages/messages.dart';
import 'package:cribb/pages/profiles.dart';
import 'package:cribb/pages/wrapper.dart';
import 'package:cribb/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: ChangeNotifierProvider(
        create: (context) => HouseShop(),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => const Wrapper(),
            '/favorites': (context) => const Favorites(),
            '/messages': (context) => const Messages(),
            '/profile': (context) => const Profile(),
          },
        ),
      ),
    );
  }
}

 