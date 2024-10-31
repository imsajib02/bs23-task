part of 'search_result_model.dart';

SearchResultModel _$fromJson(Map<String, dynamic> json) => SearchResultModel(
  totalCount: json['total_count'] as int?,
  itemList: json['items'] == null ? null : List<RepositoryModel>.from(json['items'].map((item) => RepositoryModel.fromJson(item))),
);

@override
Map<String, dynamic> _$toJson(SearchResultModel model) => {
  'total_count': model.totalCount,
  'items': model.itemList?.map((model) => model.toJson()),
};