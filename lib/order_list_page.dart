import 'package:flutter/material.dart';
import 'package:hotel_menu_app/new_ui.dart';
import 'package:hotel_menu_app/providers/item_provider.dart';
import 'package:hotel_menu_app/widgets/changeOrderButton.dart';
import 'package:provider/provider.dart';

import 'model/item.dart';
import 'order_confirm_page.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    final list = context.read<ItemProvider>().list;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
            title: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFFE4EfE9), Color(0xFF93A5CF)])),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Select Your Food",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
              ),
            ),
            elevation: 0,
            //shadowColor: Color(0xFFee9ca7),
            backgroundColor: Colors.transparent),
        body: _listView(list, context),
        // body: _gridView(list, context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(200, 183, 177, 222),
          child: Icon(Icons.shopping_bag_outlined),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderConfirmPage()));
          },
        ),
      ),
    );
  }

  Widget _gridView(List<Item> list, BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      // childAspectRatio: 0.75,
      children: [
        for (int i = 1; i < list.length; i++)
          Card(
            color: Colors.red,
            child: Stack(
              children: [
                Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      list[i].imgPath,
                      fit: BoxFit.cover,
                      width: 128,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(list[i].name),
                          color: Colors.white,
                        ),
                        Container(
                          child: Text(list[i].price.toString()),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }

  Stack _listView(List<Item> list, BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var item = list[index];
              return ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewUi(item))),
                leading: SizedBox(
                  child: Image.asset(item.imgPath),
                  width: 54,
                  height: 54,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.name),
                    Text(item.price.toString(),
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                trailing: UpdateOrderWidget(item),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Chip(
                      backgroundColor: Color(0xFFE9EDF5),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      label: Text(item.foodType.label,
                          style: TextStyle(fontSize: 10)),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Color(0XFF93A5CF),
                thickness: 1,
              );
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(200, 183, 177, 222),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 16, 24, 16),
              child: Text(
                  "Total: ${context.select((ItemProvider p) => p.total)}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit the App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}

class UpdateOrderWidget extends StatelessWidget {
  const UpdateOrderWidget(this.item, {Key? key}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChangeOrderBtn(Icons.remove, () => decreaseCount(context)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(context
              .watch<ItemProvider>()
              .getItemCount(item)
              .toString()
              .padLeft(2)),
        ),
        ChangeOrderBtn(Icons.add, () => increaseCount(context)),
      ],
    );
  }

  void increaseCount(BuildContext context) {
    context.read<ItemProvider>().increaseCountByOne(item);
  }

  void decreaseCount(BuildContext context) {
    context.read<ItemProvider>().decreaseCountByOne(item);
  }
}
