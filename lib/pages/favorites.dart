import 'package:cribb/components/bottom_nav.dart';
import 'package:cribb/components/house_tile.dart';
import 'package:cribb/models/house_shop.dart';
import 'package:cribb/models/house.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  void removeFavoriteHouse(House house) {
    Provider.of<HouseShop>(context, listen: false).removeFavoriteHouse(house);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully removed from favorites"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      body: Consumer<HouseShop>(
        builder: (context, value, child) => SafeArea(
          child: Column(
            children: [
              const Text(
                "Your Favorite Houses",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.fave.length,
                  itemBuilder: (context, index) {
                    //get individual drinks
                    House house = value.fave[index];
          
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: HouseTile(
                        onIconTap: () => removeFavoriteHouse(house),
                        icon: const Icon(
                        Icons.delete_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                        house: house,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
