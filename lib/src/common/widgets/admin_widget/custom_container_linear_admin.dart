import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class CustomContainerLinearAdmin extends StatelessWidget {
  const CustomContainerLinearAdmin({
    required this.height,
    required this.width,
    required this.child,
    super.key,
  });
  final double height;
  final double width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            context.colors.containerShadow1!.withOpacity(.8),
            context.colors.containerShadow2!..withOpacity(.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
        boxShadow:  [
          BoxShadow(
            color:  context.colors.containerShadow1!.withOpacity(0.3),
            blurRadius: 8,
            offset:const  Offset(0, 4),
          ),
          BoxShadow(
            color:  context.colors.containerShadow2!.withOpacity(0.3),
            blurRadius: 8,
            offset:const  Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}