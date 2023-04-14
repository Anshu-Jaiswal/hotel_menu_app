import 'package:flutter/material.dart';
import 'package:hotel_menu_app/constants.dart';
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
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
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
      color: Color(0xFF93A5CF),
      child: Center(
        child: Image.asset(ASSET_LOGO_IMG, color: Colors.white),
      ),
    );
  }
}
