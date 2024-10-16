import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_request_body.g.dart';
@JsonSerializable()
class RegistrationRequestBody {
  RegistrationRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  final String name;
  final String email;
  final String password;
  final String avatar;
  Map<String, dynamic> toJson() => _$RegistrationRequestBodyToJson(this);
}
