import 'package:oms/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    required int id,
    required String name,
    required String image,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(JSON json) => _$CategoryModelFromJson(json);
}
