import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';

part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  factory Contact({
    String? youtube,
    String? regions,
    String? name,
    Object? updated_at,
    String? facebook,
    Object? created_at,
    String? descriptions,
    int? id,
    String? hot_line,
    String? email,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}
