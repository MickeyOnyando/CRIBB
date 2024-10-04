import 'package:cribb/pages/favorites.dart';
import 'package:cribb/pages/homepage.dart';
import 'package:cribb/pages/messages.dart';
import 'package:cribb/pages/profiles.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void navigateBottomBar(int index) {
    if (mounted) {
      setState(() {
        _selectedIndex = index;
      });
    }

    switch (index) {
      case (0):
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        break;

      case (1):
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Favorites(),
          ),
        );
        break; 

      case (2):
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Messages(),
          ),
        );
        break;  

      case (3):
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Profile(),
          ),
        );
        break;   
    }
  }

  @override
  Widget build(BuildContext context) {
    return GNav(
      activeColor: Colors.blue,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.favorite,
          text: 'Favorites',
        ),
        GButton(
          icon: Icons.message,
          text: 'Messages',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
      onTabChange: (value) => navigateBottomBar(value),
      selectedIndex: _selectedIndex, // Pass the selectedIndex property,
    );
  }
}
