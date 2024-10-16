import 'package:cribb/components/house_tile.dart';
import 'package:cribb/models/house.dart';
import 'package:cribb/models/house_shop.dart';
import 'package:flutter/material.dart';

class HeaderAndSeachbar extends StatefulWidget {
  const HeaderAndSeachbar({super.key});

  @override
  State<HeaderAndSeachbar> createState() => _HeaderAndSeachbarState();
}

class _HeaderAndSeachbarState extends State<HeaderAndSeachbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.16 - 27,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  "Hello Mike",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 54,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.blue.withOpacity(0.15),
                    ),
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.blue.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  HouseShop house = HouseShop();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<House> _matchHouses = [];
    for (var home in house.house) {
      if (home.university.toLowerCase().contains(query.toLowerCase())) {
        _matchHouses.add(home);
      }
    }
    return ListView.builder(
      itemCount: _matchHouses.length,
      itemBuilder: (context, index) {
        return HouseTile(
          onIconTap: () => {},
          icon: const Icon(
            Icons.favorite,
            size: 30,
            color: Colors.amber,
          ),
          house: _matchHouses[index],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<House> _matchHouses = [];
    for (var home in house.house) {
      if (home.university.toLowerCase().contains(query.toLowerCase())) {
        _matchHouses.add(home);
      }
    }
    return ListView.builder(
      itemCount: _matchHouses.length,
      itemBuilder: (context, index) {
        return HouseTile(
          onIconTap: () => {},
          icon: const Icon(
            Icons.favorite,
            size: 30,
            color: Colors.amber,
          ),
          house: _matchHouses[index],
        );
      },
    );
  }
}
