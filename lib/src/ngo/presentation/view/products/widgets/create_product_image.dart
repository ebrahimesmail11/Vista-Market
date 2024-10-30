import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProductImage extends StatelessWidget {
  const CreateProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.zero,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: Container(
          height: 90.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
            size: 50.sp,
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 6.h,
      ),
      itemCount: 3,
    );
  }
}
