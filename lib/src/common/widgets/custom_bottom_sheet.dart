import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/extensions.dart';

class CustomBottomSheet {
  CustomBottomSheet._();
  static Future<void> showModelBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) {
    return showModalBottomSheet<dynamic>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), 
        ),
      ),
      isScrollControlled: true,
      backgroundColor: backgroundColor??context.colors.bluePinkDark,
      barrierColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: widget,
          ),
          ),
        );
      },
    ).whenComplete(whenComplete??(){});
  }
}
