
import 'package:flutter_lehoang_extracare/data/model/base/base_request.dart';
import 'package:flutter_lehoang_extracare/data/model/base/result.dart';
import 'package:flutter_lehoang_extracare/data/model/gift/gift.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_gift.dart';
import 'package:flutter_lehoang_extracare/data/model/profile/history_point.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_exchange_gift.dart';

abstract class GiftRepository {
  Future<Result<List<Gift>?>> loadGifts(BaseRequest request);

  Future<Result<dynamic>> exchangeGift(int giftId, RequestExchangeGift request);
}
