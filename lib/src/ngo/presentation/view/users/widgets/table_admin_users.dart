import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/text_styles.dart';
import 'package:vista_market/src/common/network/models/all_users/all_users_response.dart';
import 'package:vista_market/src/common/widgets/text_app.dart';
import 'package:vista_market/src/ngo/presentation/view/users/widgets/table_cell_title_widget.dart';

class TableAdminUsers extends StatelessWidget {
  const TableAdminUsers({required this.usersList, super.key});
final List<AllUsersResponseDataUsers> usersList;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: context.colors.bluePinkLight!,
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(100.w),
        1: const FlexColumnWidth(),
        2: FixedColumnWidth(110.w),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: context.colors.bluePinkDark,
          ),
          children: const [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                title: 'Name',
                icon: Icons.person,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                title: 'Email',
                icon: Icons.email_outlined,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                title: 'Delete',
                icon: Icons.delete_forever,
              ),
            ),
          ],
        ),
        ...List.generate(
          usersList.length,
          (index) => TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: TextApp(
                    text: usersList[index].name!,
                    theme: context.displaySmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: TextStyles.medium,
                      color: context.colors.textColor,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextApp(
                    text: usersList[index].email!,
                    theme: context.displaySmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: TextStyles.medium,
                      color: context.colors.textColor,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
