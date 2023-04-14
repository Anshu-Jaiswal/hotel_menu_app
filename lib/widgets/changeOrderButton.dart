import 'package:flutter/material.dart';

class ChangeOrderBtn extends StatelessWidget {
  const ChangeOrderBtn(this.icon, this.onPressed, {Key? key}) : super(key: key);
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0XFFE9EDF5),
      child: Card(
        color: Color(0XFF93A5CF),
        child: IconButton(
          icon: Icon(icon, color: Colors.white, weight: 5, size: 20),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
