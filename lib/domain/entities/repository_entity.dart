class RepositoryEntity {

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

  const RepositoryEntity({this.id, this.name, this.owner, this.htmlUrl, this.stars, this.forks, this.openIssuesCount,
    this.language, this.visibility, this.topics, this.description, this.updatedAt});
}