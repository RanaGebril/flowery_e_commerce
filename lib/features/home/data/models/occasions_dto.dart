import 'package:flowery_e_commerce/features/home/domain/entities/occasion_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'occasions_dto.g.dart';

@JsonSerializable()
class OccasionsDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "isSuperAdmin")
  final bool? isSuperAdmin;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  OccasionsDto ({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.isSuperAdmin,
    this.createdAt,
    this.updatedAt,
  });

  factory OccasionsDto.fromJson(Map<String, dynamic> json) {
    return _$OccasionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsDtoToJson(this);
  }

  OccasionEntity toEntity() {
    return OccasionEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
      isSuperAdmin: isSuperAdmin,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

