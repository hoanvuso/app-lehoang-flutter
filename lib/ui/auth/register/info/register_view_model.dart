import 'dart:async';
import 'package:flutter_lehoang_extracare/data/model/request/request_register.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/auth/auth_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerViewModel =
    ChangeNotifierProvider.autoDispose((ref) => RegisterViewModel(ref.read(authRepositoryProvider)));

class RegisterViewModel extends BaseLoadingChangeNotifier {
  final AuthRepository _authRepository;

  RegisterViewModel(this._authRepository);

  Future<bool?> register(String username, String password) async {
    final request = RequestRegister(
      username: username,
      password: password,
    );
    final result = await handleResultAPI<bool>(_authRepository.register(request), isShowLoading: true);
    return result;
    // if (result != null && result is num) {
    //   return true;
    // } else
    //   return false;
  }
}
