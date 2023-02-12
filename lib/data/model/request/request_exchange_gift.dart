import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_exchange_gift.freezed.dart';

part 'request_exchange_gift.g.dart';

@freezed
class RequestExchangeGift with _$RequestExchangeGift {
  factory RequestExchangeGift({
    int? qty,
  }) = _RequestExchangeGift;

  factory RequestExchangeGift.fromJson(Map<String, dynamic> json) => _$RequestExchangeGiftFromJson(json);
}
