import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';

class SearchAdminUsers extends StatelessWidget {
  const SearchAdminUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      hintText: 'Search Users',
      keyboardType: TextInputType.emailAddress,
      onChanged: (p0) {
        return null;
      },
      suffixIcon: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.clear,
          color: context.colors.bluePinkLight,
        ),
      ),
    );
  }
}
