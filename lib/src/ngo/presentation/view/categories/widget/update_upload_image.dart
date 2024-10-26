import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateUploadImage extends StatelessWidget {
  const UpdateUploadImage({required this.imageUrl, super.key});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        image:  DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
