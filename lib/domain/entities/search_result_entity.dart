import 'repository_entity.dart';

class SearchResultEntity {

  final int? totalCount;
  final List<RepositoryEntity>? itemList;

  const SearchResultEntity({this.totalCount, this.itemList});
}