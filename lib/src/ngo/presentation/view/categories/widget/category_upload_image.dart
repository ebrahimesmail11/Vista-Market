import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.sizeOf(context).width,
      decoration:  BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: NetworkImage('https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-1170x780.jpg',),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
