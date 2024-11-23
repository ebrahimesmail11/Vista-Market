import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_container_linear_customer.dart';

class BannerSliders extends StatefulWidget {
  const BannerSliders({super.key});

  @override
  State<BannerSliders> createState() => _BannerSlidersState();
}

class _BannerSlidersState extends State<BannerSliders> {
  int activeIndex = 0;
  List<String> imgList = [
    'https://plus.unsplash.com/premium_photo-1672116453187-3aa64afe04ad?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1672116453187-3aa64afe04ad?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1672116453187-3aa64afe04ad?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index, realIndex) {
            return CustomContainerLinearCustomer(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 160.h,
              width: MediaQuery.sizeOf(context).width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: imgList[index],
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const SizedBox.shrink(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 30.sp,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            reverse: true,
            height: 160.h,
            autoPlay: true,
            onPageChanged: (index, reason) {},
          ),
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList
              .map(
                (e) => Container(
                  width: 10.w,
                  height: 4.h,
                  margin:  EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    color: activeIndex == imgList.indexOf(e)
                        ? context.colors.bluePinkLight
                        : Colors.white ,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
