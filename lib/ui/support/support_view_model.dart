import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catalogue.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final supportViewModel = ChangeNotifierProvider.autoDispose((ref) => SupportViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class SupportViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  SupportViewModel(this._prefsProvider, this._supportRepository);

  List<Catalogue>? listCatalogue;

  void loadCatalogueList() async {
    final listCatalogue = await handleResultAPI<List<Catalogue>?>(_supportRepository.loadCatalogueList());
    this.listCatalogue = listCatalogue;
    notifyListeners();
  }
}
