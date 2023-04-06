import 'package:flutter/material.dart';
import 'package:hotel_menu_app/order_list_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).whenComplete(() {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return OrderListPage();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade200,
      child: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
