import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  UsersResponse(this.data);
  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);
  final UsersResponseData data;
  String  get usersNameNumber {
    if (data.usersList.isEmpty) return '0';
    return data.usersList.length.toString();
  }
}

@JsonSerializable()
class UsersResponseData {
  UsersResponseData(this.usersList);
  factory UsersResponseData.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseDataFromJson(json);
  @JsonKey(name: 'users')
  final List<UsersModel> usersList;
}

@JsonSerializable()
class UsersModel {
  UsersModel(this.name);
  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
  final String? name;
}
