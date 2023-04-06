import 'package:flutter/material.dart';
import 'package:hotel_menu_app/providers/item_provider.dart';
import 'package:provider/provider.dart';

import 'model/item.dart';
import 'order_confirm_page.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);
  Future<bool> _onWillPop(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) {
    final list = context.read<ItemProvider>().list;
    return WillPopScope(
      onWillPop: () => Future.value(_onWillPop(context)),
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: _UpdateOrderWidget(item),
                );
              },
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 16, 24, 16),
                  child: Text(
                      "Total: ${context.select((ItemProvider p) => p.total)}"),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderConfirmPage()));
          },
        ),
      ),
    );
  }
}

class _UpdateOrderWidget extends StatelessWidget {
  const _UpdateOrderWidget(this.item, {Key? key}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ChangeOrderBtn(Icons.remove, () => _decreaseCount(context)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(context
              .watch<ItemProvider>()
              .getItemCount(item)
              .toString()
              .padLeft(2)),
        ),
        _ChangeOrderBtn(Icons.add, () => _increaseCount(context)),
      ],
    );
  }

  void _increaseCount(BuildContext context) {
    context.read<ItemProvider>().increaseCountByOne(item);
  }

  void _decreaseCount(BuildContext context) {
    context.read<ItemProvider>().decreaseCountByOne(item);
  }
}

class _ChangeOrderBtn extends StatelessWidget {
  const _ChangeOrderBtn(this.icon, this.onPressed, {Key? key})
      : super(key: key);
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade200,
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
