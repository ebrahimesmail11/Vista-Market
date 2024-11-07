import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_users_response.g.dart';

@JsonSerializable()
class AllUsersResponse {
  AllUsersResponse(
    this.data,
  );

  factory AllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$AllUsersResponseFromJson(json);
  final AllUsersResponseData data;
  List<AllUsersResponseDataUsers> get usersList {
    if(data.users.isNotEmpty) {
      return data.users;
    }
    return [];
  }
}

@JsonSerializable()
class AllUsersResponseData {
  AllUsersResponseData(
    this.users,
  );
  factory AllUsersResponseData.fromJson(Map<String, dynamic> json) =>
      _$AllUsersResponseDataFromJson(json);
  final List<AllUsersResponseDataUsers> users;
}

@JsonSerializable()
class AllUsersResponseDataUsers {
  AllUsersResponseDataUsers(
    this.name,
    this.id,
    this.email,
  );

  factory AllUsersResponseDataUsers.fromJson(Map<String, dynamic> json) =>
      _$AllUsersResponseDataUsersFromJson(json);
  final String? name;
  final String? id;
  final String? email;
}
