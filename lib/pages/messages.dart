import 'package:cribb/components/bottom_nav.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      body: const SafeArea(
        child: Center(
          child: Text('Messages'),
        ),
      ),
    );
  }
}
