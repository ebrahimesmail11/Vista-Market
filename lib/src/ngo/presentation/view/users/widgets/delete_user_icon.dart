import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:vista_market/src/ngo/presentation/cubit/delete_users/delete_users_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_users/get_all_users_cubit.dart';

class DeleteUserIcon extends StatelessWidget {
  const DeleteUserIcon({
    required this.userId,
    super.key,
  });
  final String userId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUsersCubit, DeleteUsersState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllUsersCubit>().getAllUsers(
                  context,
                  isNotLoading: false,
                );
            MotionToast.success(
              description: const Text('Your user has been deleted.'),
            ).show(context);
          },
          failure: (error) {
            MotionToast.error(description: Text(error)).show(context);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (id == userId) {
              return SizedBox(
                height: 30.h,
                width: 30.w,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 25,
                ),
              );
            }
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<DeleteUsersCubit>().deleteUser(
                      context,
                      userId: userId,
                    );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            );
          },
        );
      },
    );
  }
}
