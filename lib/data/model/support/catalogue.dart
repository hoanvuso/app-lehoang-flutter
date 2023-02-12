import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalogue.freezed.dart';

part 'catalogue.g.dart';

@freezed
class Catalogue with _$Catalogue {
  factory Catalogue({
    int? is_active,
    Object? updated_at,
    int? ordering,
    String? name,
    String? link,
    Object? created_at,
    int? id,
  }) = _Catalogue;

  factory Catalogue.fromJson(Map<String, dynamic> json) => _$CatalogueFromJson(json);
}
