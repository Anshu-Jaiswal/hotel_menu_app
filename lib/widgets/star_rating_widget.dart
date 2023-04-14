import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({
    required this.full,
    required this.half,
    required this.total,
    this.color = Colors.black,
    super.key,
  }) : assert(total >= full + half);
  final int full, half, total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 1; i <= full; i++) Icon(Icons.star, color: color),
        for (int i = 1; i <= half; i++) Icon(Icons.star_half, color: color),
        for (int i = 1; i <= (total - full - half); i++)
          Icon(Icons.star_border, color: color),
      ],
    );
  }
}
