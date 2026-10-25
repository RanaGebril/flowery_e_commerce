import 'package:flowery_e_commerce/features/auth/data/models/response/user_dto.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable()
class AuthResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto user;
  @JsonKey(name: "token")
  final String token;

  AuthResponseDto({this.message, required this.user, required this.token});

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponseDtoToJson(this);
  }

  AuthSession toEntity() {
    return AuthSession(user: user.toEntity(), token: token);
  }
}
