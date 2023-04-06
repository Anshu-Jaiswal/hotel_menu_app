class Item {
  String name;
  String id;
  int price;
  Item({required this.id, required this.name, required this.price});
}

List<Item> allItems = [
  Item(id: "N60", name: "Noodle", price: 60),
  Item(id: "M80", name: "Manchurian", price: 80),
  Item(id: "P100", name: "Pasta", price: 100),
  Item(id: "B70", name: "Burger", price: 70),
  Item(id: "CP120", name: "Chilli Paneer", price: 120),
  Item(id: "FF50", name: "French Fries", price: 50),
  Item(id: "CC60", name: "ColdCoffee", price: 60),
  Item(id: "CB150", name: "Cheese Ball", price: 150),
  Item(id: "SR100", name: "Spring Roll", price: 100),
];
