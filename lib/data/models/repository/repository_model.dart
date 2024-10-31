import '../../../core/abstractions/entity_convertible.dart';
import '../../../domain/entities/repository_entity.dart';

part 'repository_mapper.dart';

class RepositoryModel implements EntityConvertible<RepositoryModel, RepositoryEntity> {

  final String? name;
  final String? owner;
  final String? htmlUrl;
  final int? stars;
  final int? forks;
  final String? description;
  final String? language;
  final String? updatedAt;

  const RepositoryModel({this.name, this.owner, this.htmlUrl, this.stars, this.forks,
    this.language, this.description, this.updatedAt});

  @override
  RepositoryModel fromEntity(RepositoryEntity entity) => throw UnimplementedError();

  @override
  RepositoryEntity toEntity() => RepositoryEntity(
    name: name,
    owner: owner,
    htmlUrl: htmlUrl,
    stars: stars,
    forks: forks,
    description: description,
    language: language,
    updatedAt: updatedAt,
  );

  factory RepositoryModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}