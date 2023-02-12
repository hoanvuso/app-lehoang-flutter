import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationSystemDetailViewModel = ChangeNotifierProvider.autoDispose((ref) => NotificationSystemDetailViewModel(
      ref.read(prefsProvider),
      ref.read(newsRepositoryProvider),
    ));

class NotificationSystemDetailViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final NewsRepository _newsRepository;

  NotificationSystemDetailViewModel(this._prefsProvider, this._newsRepository);

  NewObject? newObject;

  void loadDetailNotification(int? id) async {
    if (id == null) return;
    final result = await handleResultAPI<NewObject>(_newsRepository.loadDetailNew(id));
    this.newObject = result;
    notifyListeners();
  }
}
