import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'share_cubit_state.dart';
part 'share_cubit_cubit.freezed.dart';

class ShareCubitCubit extends Cubit<ShareCubitState> {
  ShareCubitCubit() : super(const ShareCubitState.initial());

  Future<void> shareProduct({
    required int productId,
    required String title,
    required String description,
  }) async {
    emit(ShareCubitState.loading(productId: productId));
    final productLink = Uri(
      scheme: 'flutterDeepLink',
      host: 'visita-market',
      path: '/product/$productId',
      // scheme: 'https',
      // host: 'www.vista-market.com',
      // path: '/product/$productId',
      queryParameters: {
        'title': title,
        'description': description,
      },
    );

    // نص المشاركة
    final shareContent =
        '✨ $title ✨\n\n$description\n\n📎 رابط المنتج: $productLink';

    // استخدام share_plus للمشاركة
    await Share.share(shareContent);

    emit(const ShareCubitState.success());
  }
}
