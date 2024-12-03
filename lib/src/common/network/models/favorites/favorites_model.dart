import 'package:hive_flutter/adapters.dart';
part 'favorites_model.g.dart';

@HiveType(typeId: 1)
class FavoritesModel extends HiveObject {
  FavoritesModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.categoryName,
  });
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String categoryName;
}
