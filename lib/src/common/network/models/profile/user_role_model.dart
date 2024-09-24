import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_model.g.dart';
@JsonSerializable()
class UserRoleModel {
   UserRoleModel({required this.userRole});
  factory UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoleModelFromJson(json);

  @JsonKey(name: 'role')
  final String? userRole;
}
