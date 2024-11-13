import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/admin_widget/admin_app_bar_widget.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_notification/get_all_notification_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/notifications/widgets/add_notification_body.dart';

class NotificatinsScreen extends StatelessWidget {
  const NotificatinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAllNotificationCubit>()
            ..getAllNotification(),
        ),
      ],
      child: Scaffold(
        backgroundColor: context.colors.mainColor,
        appBar: AdminAppBarWidget(
          isMain: true,
          backgroundColor: context.colors.mainColor!,
          title: 'Notifications',
        ),
        body: const AddNotificationBody(),
      ),
    );
  }
}
