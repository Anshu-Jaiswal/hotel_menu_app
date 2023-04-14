import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/item_provider.dart';

class OrderConfirmPage extends StatelessWidget {
  const OrderConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedItems = context.read<ItemProvider>().filterItem();
    var totalBill = context.read<ItemProvider>().total;
    var items = selectedItems.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 300,
          alignment: Alignment.center,
          margin: EdgeInsetsDirectional.only(top: 25, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: const Text("Your Order",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFFE4EfE9), Color(0xFF93A5CF)])),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: selectedItems.isEmpty
          ? const Center(child: Text("You haven't ordered anything"))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedItems.length,
                    itemBuilder: (context, index) {
                      var item = items[index];
                      int quantity = selectedItems[item] ?? 0;
                      int price = item.price;
                      return Card(
                        color: Colors.grey.shade50,
                        margin: EdgeInsets.only(top: 4, bottom: 2),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            tileColor: Color(0xFFE5E6E7),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            title: Text(item.name,
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            subtitle: Text("Quantity: $quantity",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            trailing: Text("Rs. ${quantity * price}/-",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  color: Color(0XFFD3D5D9), //
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "Total : $totalBill",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
