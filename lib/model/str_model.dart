import 'package:freezed_annotation/freezed_annotation.dart';

part 'str_model.freezed.dart';
part 'str_model.g.dart';

@freezed
class StrModel with _$StrModel {
  const factory StrModel({
    required String str,
    DateTime? createdAt,
    DateTime? usedAt,
    DateTime? pickedAt,
  }) = _StrModel;

  factory StrModel.fromJson(Map<String, dynamic> json) =>
      _$StrModelFromJson(json);
}
