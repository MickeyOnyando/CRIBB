import 'package:cribb/components/bottom_nav.dart';
import 'package:cribb/components/header_seachbar.dart';
import 'package:cribb/components/house_type.dart';
import 'package:cribb/components/house_tile.dart';
import 'package:cribb/models/house_shop.dart';
import 'package:cribb/models/house.dart';
import 'package:cribb/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();
  //list of house types
  final List _houseTypes = [
    //[houseType] [selected]
    [
      "Bedsitters",
      false,
    ],

    [
      "Single Rooms",
      false,
    ],

    [
      "1+ Bedrooms",
      false,
    ],

    [
      "Mabati",
      false,
    ],
  ];

  //selected house type method
  void houseTypeSelected(int index) {
    setState(
      () {
        for (int i = 0; i < _houseTypes.length; i++) {
          _houseTypes[i][1] = false;
        }
        _houseTypes[index][1] = true;
      },
    );
  }

  void addFavoriteHouse(House house) {
    Provider.of<HouseShop>(context, listen: false).addFavoriteHouse(house);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully added to favorites"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          TextButton.icon(
            onPressed: () async {
              try {
                await _auth.signingOut();
                // Navigate to the login page or any other page after sign out
                
              } catch (e) {
                print('Error signing out: $e');
              }
            },
            label: const Text('Logoff'),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
      body: Consumer<HouseShop>(
        builder: (context, value, child) => Column(
          children: [
            const HeaderAndSeachbar(),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: _houseTypes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HouseType(
                        houseType: _houseTypes[index][0],
                        isSelected: _houseTypes[index][1],
                        onTap: () => houseTypeSelected(index),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.house.length,
                  itemBuilder: (context, index) {
                    //Get houses from HouseShop
                    House house = value.house[index];

                    //return list of houses
                    return HouseTile(
                      onIconTap: () => addFavoriteHouse(house),
                      icon: const Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.amber,
                      ),
                      house: house,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
