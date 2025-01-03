import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_model.g.dart';

@JsonSerializable()
class UserRoleModel {
  UserRoleModel(
    this.userId,
    this.userRole,
    this.email,
    this.name,
    this.avatar,
  );
  factory UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoleModelFromJson(json);

  @JsonKey(name: 'role')
  final String? userRole;
  @JsonKey(name: 'id')
  final int? userId;
  final String? email;
  final String? name;
  final String? avatar;
}
