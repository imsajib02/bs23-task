class RepositoryEntity {

  final String? name;
  final String? owner;
  final String? htmlUrl;
  final int? stars;
  final int? forks;
  final String? description;
  final String? language;
  final String? updatedAt;

  const RepositoryEntity({this.name, this.owner, this.htmlUrl, this.stars, this.forks,
    this.language, this.description, this.updatedAt});
}