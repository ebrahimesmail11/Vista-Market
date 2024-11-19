import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/profile/user_role_model.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({required this.userModel, super.key});
final UserRoleModel userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(50.r),
          ),
          child: CachedNetworkImage(
            height: 80.h,
            width: 80.w,
            imageUrl: userModel.avatar ?? 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
            errorWidget: (context, url, error) => Icon(
              Icons.person,
              size: 70.sp,
              color: Colors.red,
            ),
          ),
        ),
        7.verticalSpace,
        TextApp(
          text: userModel.name!.toLowerCase().toCapitalize(),
          theme: context.displaySmall!.copyWith(
            fontSize: 18.sp,
            fontWeight: TextStyles.bold,
            color: context.colors.textColor,
          ),
        ),
          7.verticalSpace,
        TextApp(
          text: userModel.email!.toLowerCase().toCapitalize(),
          theme: context.displaySmall!.copyWith(
            fontSize: 14.sp,
            fontWeight: TextStyles.regular,
            color: context.colors.textColor,
          ),
        ),
      ],
    );
  }
}
