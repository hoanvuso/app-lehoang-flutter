// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_tech_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductTechInformation _$_$_ProductTechInformationFromJson(
    Map<String, dynamic> json) {
  return _$_ProductTechInformation(
    feature_id: json['feature_id'] as String?,
    value: json['value'] as String?,
    feature: json['feature'] == null
        ? null
        : ProductCategoryFeature.fromJson(
            json['feature'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ProductTechInformationToJson(
        _$_ProductTechInformation instance) =>
    <String, dynamic>{
      'feature_id': instance.feature_id,
      'value': instance.value,
      'feature': instance.feature,
    };
