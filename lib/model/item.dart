import 'package:hotel_menu_app/constants.dart';

class Item {
  String name;
  String id;
  int price;
  Item(
      {required this.id,
      required this.name,
      required this.price,
      this.imgPath = ASSET_LOGO_IMG,
      required this.foodType});
  String imgPath;
  FoodType foodType;
}

List<Item> allItems = [
  Item(
      foodType: FoodType.veg,
      id: "N60",
      name: "Noodle",
      price: 60,
      imgPath: FoodImages.noodles),
  Item(
    foodType: FoodType.veg,
    id: "M80",
    name: "Manchurian",
    price: 80,
    imgPath: FoodImages.manchurian,
  ),
  Item(
      foodType: FoodType.veg,
      id: "P100",
      name: "Pasta",
      price: 100,
      imgPath: FoodImages.pasta),
  Item(
      foodType: FoodType.veg,
      id: "B70",
      name: "Burger",
      price: 70,
      imgPath: FoodImages.burger),
  Item(
      foodType: FoodType.veg,
      id: "CP120",
      name: "Chilli Paneer",
      price: 120,
      imgPath: FoodImages.chillipaneer),
  Item(
      foodType: FoodType.veg,
      id: "FF50",
      name: "French Fries",
      price: 50,
      imgPath: FoodImages.frenchfries),
  Item(
      foodType: FoodType.veg,
      id: "CC60",
      name: "ColdCoffee",
      price: 60,
      imgPath: FoodImages.coldcoffee),
  Item(
      foodType: FoodType.veg,
      id: "CB150",
      name: "Cheese Ball",
      price: 150,
      imgPath: FoodImages.cheeseball),
  Item(
      foodType: FoodType.veg,
      id: "SR100",
      name: "Spring Roll",
      price: 100,
      imgPath: FoodImages.springroll),
  Item(
      id: "CT180",
      name: "Chicken Tikka",
      price: 180,
      foodType: FoodType.non_veg,
      imgPath: FoodImages.chickentikka),
  Item(
      id: "CC150",
      name: "Chilli Chicken",
      price: 150,
      foodType: FoodType.non_veg,
      imgPath: FoodImages.chillichicken),
  Item(
      id: "CB250",
      name: "Chilli Biryani",
      price: 250,
      foodType: FoodType.non_veg,
      imgPath: FoodImages.chickenbiryani),
  Item(
      id: "CR100",
      name: "ChickenRoll",
      price: 100,
      foodType: FoodType.non_veg,
      imgPath: FoodImages.chickenRoll)
];

enum FoodType {
  veg("Veg"), //Declare all instances at the beginning of the enum
  non_veg("Non-Veg");

  final String label; //  instance variables must be final.
  const FoodType(this.label); //constructors must be constant.
}
