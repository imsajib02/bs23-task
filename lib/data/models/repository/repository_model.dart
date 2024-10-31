import '../../../core/abstractions/entity_convertible.dart';
import '../../../domain/entities/repository_entity.dart';

part 'repository_mapper.dart';

class RepositoryModel implements EntityConvertible<RepositoryModel, RepositoryEntity> {

  final int? id;
  final String? name;
  final String? owner;
  final String? htmlUrl;
  final int? stars;
  final int? forks;
  final int? openIssuesCount;
  final String? description;
  final String? language;
  final String? visibility;
  final List<String>? topics;
  final String? updatedAt;

  const RepositoryModel({this.id, this.name, this.owner, this.htmlUrl, this.stars, this.forks, this.openIssuesCount,
    this.language, this.visibility, this.topics, this.description, this.updatedAt});

  @override
  RepositoryModel fromEntity(RepositoryEntity entity) => throw UnimplementedError();

  @override
  RepositoryEntity toEntity() => RepositoryEntity(
    id: id,
    name: name,
    owner: owner,
    htmlUrl: htmlUrl,
    stars: stars,
    forks: forks,
    openIssuesCount: openIssuesCount,
    description: description,
    language: language,
    visibility: visibility,
    topics: topics,
    updatedAt: updatedAt,
  );

  factory RepositoryModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}