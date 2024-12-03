import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/network/hive/hive_database.dart';
import 'package:vista_market/src/common/network/models/favorites/favorites_model.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState.initial());
  Future<void> addAndRemoveFavorites({
    required String id,
    required String title,
    required String image,
    required String categoryName,
    required String price,
  }) async {
    emit(const FavoritesState.initial());
    final exitIndex =HiveDatabase()
        .favoritesBox!
        .values
        .toList()
        .indexWhere((e) => e.id == id);
    if (exitIndex >= 0) {
      await HiveDatabase().favoritesBox?.deleteAt(exitIndex);
    } else {
      await HiveDatabase().favoritesBox?.add(
            FavoritesModel(
              id: id,
              title: title,
              image: image[0],
              categoryName: categoryName,
              price: price,
            ),
          );
    }

    emit(const FavoritesState.addAndRemoveFavorites());
  }

  bool isFavorite(String productId) {
    return HiveDatabase().favoritesBox?.values.any((e) => e.id == productId) ??
        false;
  }

  List<FavoritesModel> get favoritesList {
    return HiveDatabase().favoritesBox!.values.toList();
  }
}
