import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({required this.size ,super.key});
final double size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.favorite_outline,
        color: context.colors.textColor,
        size:30,
      ),
    );
  }
}