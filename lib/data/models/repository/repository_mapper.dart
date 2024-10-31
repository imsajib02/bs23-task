part of 'repository_model.dart';

RepositoryModel _$fromJson(Map<String, dynamic> json) => RepositoryModel(
  name: json['name'] as String?,
  owner: json['owner']['login'] as String?,
  htmlUrl: json['html_url'] as String?,
  stars: json['stargazers_count'] as int?,
  forks: json['forks_count'] as int?,
  description: json['description'] as String?,
  language: json['language'] as String?,
  updatedAt: json['updated_at'] as String?,
);

@override
Map<String, dynamic> _$toJson(RepositoryModel model) => {
  'name': model.name,
  'owner': {
    'login': model.owner,
  },
  'html_url': model.htmlUrl,
  'stargazers_count': model.stars,
  'forks_count': model.forks,
  'description': model.description,
  'language': model.language,
  'updated_at': model.updatedAt,
};