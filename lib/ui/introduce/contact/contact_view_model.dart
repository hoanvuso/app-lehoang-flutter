import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/support/contact.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final contactViewModel = ChangeNotifierProvider.autoDispose((ref) => ContactViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class ContactViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  ContactViewModel(this._prefsProvider, this._supportRepository);

  List<Contact>? contactList;

  void loadContactList() async {
    final list = await handleResultAPI<List<Contact>>(_supportRepository.loadContacts(), isShowLoading: true);
    contactList = list;
    notifyListeners();
  }
}
