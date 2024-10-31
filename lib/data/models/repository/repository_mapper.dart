part of 'repository_model.dart';

RepositoryModel _$fromJson(Map<String, dynamic> json) => RepositoryModel(
  id: json['id'] as int?,
  name: json['name'] as String?,
  owner: json['owner']['login'] as String?,
  htmlUrl: json['html_url'] as String?,
  stars: json['stargazers_count'] as int?,
  forks: json['forks_count'] as int?,
  openIssuesCount: json['open_issues_count'] as int?,
  description: json['description'] as String?,
  language: json['language'] as String?,
  visibility: json['visibility'] as String?,
  topics: json['topics'] == null ? null : List<String>.from(json['topics'].map((item) => item.toString())),
  updatedAt: json['updated_at'] as String?,
);

@override
Map<String, dynamic> _$toJson(RepositoryModel model) => {
  'id': model.id,
  'name': model.name,
  'owner': {
    'login': model.owner,
  },
  'html_url': model.htmlUrl,
  'stargazers_count': model.stars,
  'forks_count': model.forks,
  'open_issues_count': model.openIssuesCount,
  'description': model.description,
  'language': model.language,
  'visibility': model.visibility,
  'topics': model.topics?.map((topic) => topic),
  'updated_at': model.updatedAt,
};