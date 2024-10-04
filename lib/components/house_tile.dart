import 'package:cribb/models/house.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HouseTile extends StatefulWidget {
  final House house;
  final Icon icon;
  final VoidCallback onIconTap;

  const HouseTile({
    super.key,
    required this.house,
    required this.icon,
    required this.onIconTap,
  });

  @override
  State<HouseTile> createState() => _HouseTileState();
}

class _HouseTileState extends State<HouseTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(widget.house.houseImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: GestureDetector(
                      onTap: widget.onIconTap, child: widget.icon),
                ),
              ],
            ),
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.house.houseName,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(widget.house.roomType),
                  Text(widget.house.houseRating),
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),

            const SizedBox(height: 1,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.house.houseRent),
            ),

            const SizedBox(height: 1,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                children: widget.house.houseAmenities
                    .map(
                      (amenity) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          color: Colors.green,
                          padding: const EdgeInsets.all(8),
                          child: Text(amenity),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            const SizedBox(height: 1,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.house.houseLocation),
            ),

            const SizedBox(height: 1,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.house.university),
            ),
          ],
        ),
      ),
    );
  }
}