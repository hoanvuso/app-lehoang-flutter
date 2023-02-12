import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_help.freezed.dart';

part 'challenge_help.g.dart';

@freezed
class ChallengeHelp with _$ChallengeHelp {
  factory ChallengeHelp({
    Object? image,
    String? image_url,
    Object? created_at,
    Object? short_body,
    String? body,
    String? type,
    Object? updated_at,
    Object? content_type,
    Object? image_path,
    String? name,
    int? id,
    Object? document_file,
    String? slug,
  }) = _ChallengeHelp;

  factory ChallengeHelp.fromJson(Map<String, dynamic> json) => _$ChallengeHelpFromJson(json);
}
