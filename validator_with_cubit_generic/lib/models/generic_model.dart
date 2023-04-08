import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_model.g.dart';

part 'generic_model.freezed.dart';

@freezed
class GenericModel with _$GenericModel {
  const factory GenericModel({required String id, required String title}) =
  _GenericModel;

  factory GenericModel.fromJson(Map<String, dynamic> json) =>
      _$GenericModelFromJson(json);
}
