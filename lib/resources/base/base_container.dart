import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/base/app_error.dart';
import 'package:flutter_lehoang_extracare/utils/util/alert_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_colors.dart';
import 'base_loading_state.dart';

class BaseContainer extends StatelessWidget {
  BaseContainer({required Widget child, required provider})
      : assert(provider != null),
        assert(provider is ChangeNotifierProvider || provider is AutoDisposeChangeNotifierProvider),
        _child = child {
    if (provider is ChangeNotifierProvider) _provider = provider as ChangeNotifierProvider<BaseLoadingChangeNotifier>?;
    if (provider is AutoDisposeChangeNotifierProvider)
      _autoDisposeProvider = provider as AutoDisposeChangeNotifierProvider<BaseLoadingChangeNotifier>?;
  }

  final Widget _child;
  ChangeNotifierProvider<BaseLoadingChangeNotifier>? _provider;
  AutoDisposeChangeNotifierProvider<BaseLoadingChangeNotifier>? _autoDisposeProvider;

  @override
  Widget build(BuildContext context) {
    final provider = _provider ?? _autoDisposeProvider;
    return Stack(children: [
      _child,
      HookBuilder(builder: (context) {
        final isLoading = useProvider(provider!.select((value) => value.isLoading));
        return isLoading ? const LoadingWave() : const SizedBox();
      }),
      HookBuilder(builder: (context) {
        final error = useProvider(provider!.select((value) => value.error));
        if (error?.getContentIfNotHandled() != null) {
          SchedulerBinding.instance?.addPostFrameCallback((_) {
            context.read(provider).pushError(null);
            final appError = error?.peekContent();
            if (appError?.type == AppErrorType.network) {
              showAlertError(context: context, message: "Kết nối mạng không khả dụng");
            } else {
              showAlertError(context: context, message: appError?.message);
            }
          });
        }
        return const SizedBox();
      }),
    ]);
  }
}

class LoadingCircular extends StatelessWidget {
  const LoadingCircular();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor)));
  }
}

class LoadingWave extends StatelessWidget {
  const LoadingWave();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: colorPrimary,
      ),
      width: 80,
      height: 60,
      child: SpinKitWave(
        size: 23,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.white : Colors.white,
            ),
          );
        },
      ),
    ));
  }
}
