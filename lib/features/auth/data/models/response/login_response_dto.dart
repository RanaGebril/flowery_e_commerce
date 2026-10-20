import 'package:flowery_e_commerce/features/auth/data/models/response/user_dto.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto user;
  @JsonKey(name: "token")
  final String token;

  LoginResponseDto({this.message, required this.user, required this.token});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseDtoToJson(this);
  }

  AuthSession toEntity() {
    return AuthSession(user: user.toEntity(), token: token);
  }
}
