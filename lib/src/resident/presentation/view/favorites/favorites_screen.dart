import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/resident/presentation/cubit/cubit/share_cubit_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/favorites/widgets/favorites_body.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
    create: (context) => getIt<FavoritesCubit>(),),
        BlocProvider(create: (context) => getIt<ShareCubitCubit>()),
      ],
      child: const FavoritesBody(),
    );
  }
}
