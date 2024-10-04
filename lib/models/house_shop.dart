import 'package:cribb/models/house.dart';
import 'package:flutter/cupertino.dart';

class HouseShop extends ChangeNotifier {
  final List<House> _house = [
    House(
      houseImagePath: "images/matasia.jpg",
      houseName: "Beautiful House 1",
      roomType: "Bedsitter",
      houseRating: "4.5",
      houseRent: "1,500/month",
      houseAmenities: [
        "Air Conditioning",
        "Gym",
        "Pool",
        "Parking"
      ],
      houseLocation: "123 Main St, Anytown, USA",
      university: "University of Nairobi"
    ),
    House(
      houseImagePath: "images/Micasa.jpg",
      houseName: "Modern Apartment",
      roomType: "1 Bedroom",
      houseRating: "4.8",
      houseRent: "2,000/month",
      houseAmenities: [
        "Air Conditioning",
        "Gym",
        "Pool",
        "Parking",
        "Doorman"
      ],
      houseLocation: "456 Elm St, Othertown, USA",
      university: "Stanford University"
    ),
    House(
      houseImagePath: "images/mugumo.jpg",
      houseName: "Cozy Cottage",
      roomType: "Single",
      houseRating: "4.2",
      houseRent: "1,200/month",
      houseAmenities: [
        "Fireplace",
        "Parking"
      ],
      houseLocation: "321 Forest Rd, Woodsville, USA",
      university: "Harvard University"
    ),
    House(
      houseImagePath: "images/matasia.jpg",
      houseName: "Beautiful House 1",
      roomType: "Bedsitter",
      houseRating: "4.5",
      houseRent: "1,500/month",
      houseAmenities: [
        "Air Conditioning",
        "Gym",
        "Pool",
        "Parking"
      ],
      houseLocation: "123 Main St, Anytown, USA",
      university: "University of Eldoret"
    ),
    House(
      houseImagePath: "images/Micasa.jpg",
      houseName: "Modern Apartment",
      roomType: "Mabati",
      houseRating: "4.8",
      houseRent: "2,000/month",
      houseAmenities: [
        "Air Conditioning",
        "Gym",
        "Pool",
        "Parking",
        "Doorman"
      ],
      houseLocation: "456 Elm St, Othertown, USA",
      university: "Harvard University"
    ),
    House(
      houseImagePath: "images/mugumo.jpg",
      houseName: "Cozy Cottage",
      roomType: "Mabati",
      houseRating: "4.2",
      houseRent: "1,200/month",
      houseAmenities: [
        "Fireplace",
        "Parking"
      ],
      houseLocation: "321 Forest Rd, Woodsville, USA",
      university: "Yale University"
    ),
    House(
      houseImagePath: "images/matasia.jpg",
      houseName: "Beautiful House 1",
      roomType: "Single",
      houseRating: "4.5",
      houseRent: "1,500/month",
      houseAmenities: [
        "Air Conditioning",
        "Gym",
        "Pool",
        "Parking"
      ],
      houseLocation: "123 Main St, Anytown, USA",
      university: "University of Eldoret"
    ),
    House(
      houseImagePath: "images/Micasa.jpg",
      houseName: "Modern Apartment",
      roomType: "Bedsitter",
      houseRating: "4.8",
      houseRent: "2,000/month",
      houseAmenities: [
        "Air Conditioning",
        "Gym",
        "Pool",
        "Parking",
        "Doorman"
      ],
      houseLocation: "456 Elm St, Othertown, USA",
      university: "Harvard University"
    ),
    House(
      houseImagePath: "images/mugumo.jpg",
      houseName: "Cozy Cottage",
      roomType: "1 Bedroom",
      houseRating: "4.2",
      houseRent: "1,200/month",
      houseAmenities: [
        "Fireplace",
        "Parking"
      ],
      houseLocation: "321 Forest Rd, Woodsville, USA",
      university: "Kenyatta University"
    ),
  ];

  //list of houses in favorites page
  final List<House> _faveHouses = [];

  //get houses for booking
  List<House> get house => _house;

  //get favorite drinks
  List<House> get fave => _faveHouses;

   //add favorite drinks
  void addFavoriteHouse(House house) {
    _faveHouses.add(house);
    notifyListeners();
  }

  //remove favorite drink
  void removeFavoriteHouse(House house) {
    _faveHouses.remove(house);
    notifyListeners();
  }
}
