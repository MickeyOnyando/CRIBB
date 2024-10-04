import 'package:cribb/components/bottom_nav.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
      body: const SafeArea(
        child: Center(
          child: Text('Profile'),
        ),
      ),
    );
  }
}
