import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocode_model.g.dart';
part 'geocode_model.freezed.dart';

@freezed
class GeocodeModel with _$GeocodeModel {
  const factory GeocodeModel({
    required String name,
    required num lat,
    required num lon,
  }) = _GeocodeModel;

  factory GeocodeModel.fromJson(Map<String, dynamic> json) =>
      _$GeocodeModelFromJson(json);
}
