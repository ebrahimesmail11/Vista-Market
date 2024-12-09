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
    required String imageUrl,
  }) async {
    emit(ShareCubitState.loading(productId: productId));
    final productLink = Uri(
      scheme: 'https',
      host: 'vista-market.web.app',
      path: '/$productId',
      queryParameters: {
        'title': title,
        'imageUrl': imageUrl,
      },
    );

    // نص المشاركة
    final shareContent =
        '✨ $title ✨\n\n$imageUrl\n\n📎 رابط المنتج: $productLink';

    // استخدام share_plus للمشاركة
    await Share.share(shareContent);

    emit(const ShareCubitState.success());
  }
}
