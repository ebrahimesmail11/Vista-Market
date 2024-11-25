import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/widgets/loading_shimmer.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_banners/get_banners_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/banners/banner_sliders.dart';

class SectionBannerSliders extends StatelessWidget {
  const SectionBannerSliders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBannersCubit, GetBannersState>(
      builder: (context, state) {
        return state.when(
          loading: () => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: LoadingShimmer(
              height: 160.h,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          success: (banners) => BannerSliders(
            bannersList: banners,
          ),
          empty: () {
            return const SizedBox.shrink();
          },
          failure: (error) {
            return Center(
              child: Text(error),
            );
          },
        );
      },
    );
  }
}
