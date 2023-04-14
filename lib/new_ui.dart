//
// https://cdn.dribbble.com/userupload/2918801/file/original-0b4719c6b9c01f51daa7d028a6535e9d.png?compress=1&resize=1600x1200
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_menu_app/order_confirm_page.dart';
import 'package:hotel_menu_app/order_list_page.dart';
import 'package:hotel_menu_app/widgets/star_rating_widget.dart';

import 'model/item.dart';

class NewUi extends StatelessWidget {
  final Item item;
  const NewUi(this.item, {Key? key}) : super(key: key);

  Widget _newUi(context) {
    return Scaffold(
      backgroundColor: const Color(0XFF93A5CF),
      body: Stack(
        children: [
          _bgdecoration(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _img(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name,
                          style: Theme.of(context).textTheme.displayMedium),
                      //_ratingReviewBar("4.5 (100 reviews)"),
                      SizedBox(height: 20),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) => print(rating),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Size", style: TextStyle(fontSize: 22)),
                          SizedBox(
                            height: 10,
                          ),
                          SizeBar(["S", "M", "L"], 1),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        child: UpdateOrderWidget(item),
                      ),
                      Spacer(),
                      Container(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                color: Colors.grey.shade400, width: 1),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.price.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  fixedSize: Size(170, 45)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OrderConfirmPage()));
                              },
                              child: Text(
                                "VIEW CART",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _img() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Image.asset(item.imgPath),
      ),
    );
  }

  Column _bgdecoration() {
    return Column(
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 4,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _newUi(context);
    return Scaffold(
        body: Container(
      color: Colors.blueGrey.shade400,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            top: 100,
            bottom: 0,
            child: Container(
                decoration: BoxDecoration(
              color: const Color(0xFFF8F9F9),
              borderRadius: BorderRadius.circular(44),
            )),
          ),
          Positioned(
            top: 10,
            left: 100,
            child: CircleAvatar(
              maxRadius: 120,
              backgroundColor: Colors.orange.shade200,
            ),
          ),
          const Positioned(
            top: 15,
            left: 105,
            child: CircleAvatar(
              maxRadius: 115,
              backgroundColor: Color(0xFFE5E6E7),
            ),
          ),
          Positioned(
              top: 60,
              left: 150,
              child: Image.asset(
                "assets/images/noodles.jpg",
                height: 140,
                width: 140,
              )),
          Positioned(
            top: 300,
            left: 180,
            child: Row(
              children: const [
                Card(
                    child: Icon(
                      Icons.minimize_outlined,
                      size: 28,
                    ),
                    color: Color(0xFFE5E6E7)),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                Card(
                  child: Icon(Icons.add, size: 28),
                  color: Color(0xFFE5E6E7),
                )
              ],
            ),
          ),
          Positioned(
            top: 400,
            left: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Noodles",
                    style: TextStyle(
                        fontSize: 34, color: Colors.blueGrey.shade400)),
                Row(
                  children: const [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star_half),
                  ],
                ),
                Text("Size",
                    style: TextStyle(
                        fontSize: 34, color: Colors.blueGrey.shade400)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: const Text("S",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor: Colors.grey.shade100,
                    ),
                    CircleAvatar(
                      child: const Text("M",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor: Colors.grey.shade100,
                    ),
                    CircleAvatar(
                      child: const Text("L",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ],
                ),
                // Divider(
                //   color: Colors.grey.shade200,
                //   thickness: 2,
                // ),
                ListTile(
                  title: const Text("100"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderConfirmPage()),
                      );
                    },
                    child: const Text("ADD TO Cart",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));

    // return Container(
    //   color: Color(0xFFffe49c),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 32.0),
    //     child: CircleAvatar(
    //       backgroundColor: Color(0xff1d4489),
    //       radius: MediaQuery.of(context).size.width * 0.8,
    //     ),
    //   ),
    // );
  }

  _ratingReviewBar(String reviewText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const StarRatingWidget(full: 4, half: 1, total: 5, color: Colors.green),
        Text(reviewText)
      ],
    );
  }
}

class SizeBar extends StatefulWidget {
  const SizeBar(
    this.choices,
    this.initial, {
    super.key,
  });

  final List<String> choices;
  final int initial;

  @override
  State<SizeBar> createState() => _SizeBarState();
}

class _SizeBarState extends State<SizeBar> {
  late int current;
  @override
  void initState() {
    super.initState();
    current = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < widget.choices.length; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                current = i;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: current == i ? Colors.green : Colors.black,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(11, 8, 11, 8),
              margin: const EdgeInsets.only(right: 8),
              child: Text(
                widget.choices[i],
                style: TextStyle(
                    color: current == i ? Colors.green : Colors.black),
              ),
            ),
          ),
      ],
    );
  }
}
