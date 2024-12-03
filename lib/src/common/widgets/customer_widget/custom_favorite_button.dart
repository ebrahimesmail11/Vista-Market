import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({
    required this.onPressed,
    required this.isFavorites,
    required this.size,
    super.key,
  });
  final double size;
  final bool isFavorites;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isFavorites ? Icons.favorite : Icons.favorite_outline,
        color: isFavorites
            ? context.colors.bluePinkLight
            : context.colors.textColor,
        size: 30,
      ),
    );
  }
}
