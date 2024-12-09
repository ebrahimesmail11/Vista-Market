import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class CustomShareButton extends StatelessWidget {
  const CustomShareButton({
    required this.onPressed,
    required this.size,
    super.key,
  });
  final double size;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.share,
        color: context.colors.textColor,
        size: 30,
      ),
    );
  }
}
