import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductImage extends StatelessWidget {
  const UpdateProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.zero,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: 90.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1578589315522-9e5521b9c158?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    fit: BoxFit.fill,),
              ),
            ),
            Container(
              height: 90.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      itemCount: 3,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 6.h,
        );
      },
    );
  }
}
