import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/widgets/customer_widget/custom_app_bar.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_search/get_search_products_cubit.dart';
import 'package:vista_market/src/resident/presentation/view/search/widgets/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetSearchProductsCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.tr.search),
        body: const SearchBody(),
      ),
    );
  }
}