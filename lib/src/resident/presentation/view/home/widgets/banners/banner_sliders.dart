import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_container_linear_customer.dart';

class BannerSliders extends StatefulWidget {
  const BannerSliders({required this.bannersList, super.key});
final  List<String> bannersList ;
  @override
  State<BannerSliders> createState() => _BannerSlidersState();
}

class _BannerSlidersState extends State<BannerSliders> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount:widget.bannersList.length,
          itemBuilder: (context, index, realIndex) {
            return CustomContainerLinearCustomer(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 160.h,
              width: MediaQuery.sizeOf(context).width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl:widget.bannersList[index].imageProductFormat(),
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
            onPageChanged: (index, reason) {
               activeIndex = index;
              setState(() {
               
              });
            },
          ),
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.bannersList.asMap().entries
              .map(
                (e) => Container(
                  width: 15.w,
                  height: 4.h,
                  margin:  EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    color: activeIndex == e.key
                        ? context.colors.bluePinkLight
                        : Colors.grey ,
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
