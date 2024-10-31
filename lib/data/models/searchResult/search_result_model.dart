import '../../../core/abstractions/entity_convertible.dart';
import '../../../domain/entities/search_result_entity.dart';
import '../repository/repository_model.dart';

part 'search_result_mapper.dart';

class SearchResultModel implements EntityConvertible<SearchResultModel, SearchResultEntity> {

  final int? totalCount;
  final List<RepositoryModel>? itemList;

  const SearchResultModel({this.totalCount, this.itemList});

  @override
  SearchResultModel fromEntity(SearchResultEntity entity) => throw UnimplementedError();

  @override
  SearchResultEntity toEntity() => SearchResultEntity(
    totalCount: totalCount,
    itemList: itemList?.map((model) => model.toEntity()).toList(),
  );

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}