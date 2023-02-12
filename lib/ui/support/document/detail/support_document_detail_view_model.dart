import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/support/support_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final supportDocumentDetailViewModel = ChangeNotifierProvider.autoDispose((ref) => SupportDocumentDetailViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class SupportDocumentDetailViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  SupportDocumentDetailViewModel(this._prefsProvider, this._supportRepository);

  SupportObject? document;

  String? zoomImageUrl;

  void setZoomImageUrl(String? url) {
    zoomImageUrl = url;
    notifyListeners();
  }
}
