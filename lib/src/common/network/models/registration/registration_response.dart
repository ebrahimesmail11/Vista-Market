import 'package:freezed_annotation/freezed_annotation.dart';
part 'registration_response.g.dart';

@JsonSerializable()
class RegistrationResponse {
  RegistrationResponse(this.data);
  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseFromJson(json);
  final RegistrationData data;
}

@JsonSerializable()
class RegistrationData {
  RegistrationData(this.addUser);
  factory RegistrationData.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDataFromJson(json);
  final RegistrationAddUser addUser;
}

@JsonSerializable()
class RegistrationAddUser {
  RegistrationAddUser(
    this.id,
    this.email,
  );
  factory RegistrationAddUser.fromJson(Map<String, dynamic> json) =>
      _$RegistrationAddUserFromJson(json);
  final String? id;
  final String? email;
}
