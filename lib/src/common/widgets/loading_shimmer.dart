import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key, this.height, this.width, this.borderRadius});
  final double? height;
  final double? width;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        padding:const  EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.all(Radius.circular(borderRadius ?? 14),),
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
    );
  }
}
