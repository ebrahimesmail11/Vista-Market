import 'package:flutter/material.dart';
import 'package:vista_market/src/resident/presentation/view/home/widgets/banner_sliders.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.scrollController, super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        controller: scrollController,
        slivers: const [
           SliverToBoxAdapter(
            child: BannerSliders(),
          ),
        ],
      ),
    );
  }
}
