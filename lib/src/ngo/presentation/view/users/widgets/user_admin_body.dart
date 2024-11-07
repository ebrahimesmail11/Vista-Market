import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/ngo/presentation/view/users/widgets/search_admin_users.dart';
import 'package:vista_market/src/ngo/presentation/view/users/widgets/table_admin_users.dart';

class UserAdminBody extends StatelessWidget {
  const UserAdminBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child:  Column(
        children: [
          const SearchAdminUsers(),
          20.verticalSpace,
          Expanded(
            child: RefreshIndicator (
              onRefresh: () async {},
              child:  CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: TableAdminUsers(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                    height: 25.h,
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
