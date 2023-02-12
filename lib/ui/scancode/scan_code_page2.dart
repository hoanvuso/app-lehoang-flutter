import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/base/app_error.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/icon_button_back.dart';
import 'package:flutter_lehoang_extracare/ui/scancode/dialog_scan_confirm.dart';
import 'package:flutter_lehoang_extracare/ui/scancode/dialog_scan_success.dart';
import 'package:flutter_lehoang_extracare/ui/scancode/scan_code_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/alert_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_barcode_scanner_widget.dart';
import 'component/common_top_bar_back.dart';

class ScanCodePage2 extends StatefulWidget {
  @override
  _ScanCodePage2State createState() => _ScanCodePage2State();
}

class _ScanCodePage2State extends State<ScanCodePage2> {
  bool isContinueScan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: colorBackgroundDefault,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorPrimaryDark, colorPrimary],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.8, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              height: 60.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.h),
                    child: IconButtonBack(onPress: (){
                      final viewModel = context.read(scanCodeViewModel);
                      setState(() {
                        viewModel.notice = 1;
                        viewModel.notifyListeners();
                      });
                      Navigator.pop(context);
                    },),
                  ),
                  Expanded(child: CommonTopBarBack('Quét mã')),
                ],
              ),
            ),
            Expanded(child: _buildMainView()),
          ],
        ),
      ),
      HookBuilder(builder: (context) {
        final isLoading = useProvider(scanCodeViewModel.select((value) => value.isLoading));
        return isLoading ? const LoadingWave() : const SizedBox();
      }),
      HookBuilder(builder: (context) {
        final error = useProvider(scanCodeViewModel.select((value) => value.error));
        if (error?.getContentIfNotHandled() != null) {
          SchedulerBinding.instance?.addPostFrameCallback((_) {
            context.read(scanCodeViewModel).pushError(null);
            final appError = error?.peekContent();
            if (appError?.type == AppErrorType.network) {
              showAlertError(context: context, message: "Kết nối mạng không khả dụng");
            } else {
              showAlertError(
                  context: context,
                  message: appError?.message,
                  onPressOk: () {
                    Future.delayed(Duration(seconds: 1), () {
                      isContinueScan = false;
                    });
                  });
            }
          });
        }
        return const SizedBox();
      }),
    ]));
  }

  Widget _buildMainView() {
    return AppBarcodeScannerWidget.defaultStyle(
      resultCallback: (String code) {
        if (isContinueScan) return;
        isContinueScan = true;
        checkCodeToServer(_cutStringCode(code));
      },
    );
  }

  String _cutStringCode(String code) {
    // AP110-L;SN:CAN603V00336C;MAC:80058880A8D4
    //  http://rj.link/e?s=G1QH4N7120622&d=EW1200&m=C470AB854025
    // DS-7208HUHI-F1/S
    // 758334005
    // WUCCVP
    try {
      if (code.contains("SN:")) {
        return code.substring(code.indexOf("SN:") + 3, code.indexOf(";MAC:"));
      } else if (code.contains("rj.link")) {
        return code.substring(code.indexOf("e?s=") + 4, code.indexOf("&d="));
      } else if (code.contains("\r")) {
        return code.substring(code.indexOf("\r") + 1, code.indexOf("\r", code.indexOf("\r") + 1));
      } else
        return code;
    } catch (e) {
      return code;
    }
  }

  void checkCodeToServer(String code) {
    final viewModel = context.read(scanCodeViewModel);
    if(viewModel.notice == 1){
      showAlertError(context: context, message: 'Chú ý Tài khoản sẽ bị khoá nếu gian lận tích điểm!', onPressOk: (){
        setState(() {
          viewModel.notice = 0;
          viewModel.notifyListeners();
        });
        viewModel.checkCode(code).then((responseScan) {
          if (responseScan != null) {
            showDialog(context: context, builder: (context) => DialogScanConfirm(code, responseScan)).then((value) {
              Future.delayed(Duration(seconds: 1), () {
                isContinueScan = false;
              });
              if (value == true) {
                sendCodeToServer(code);
              }
            });
          }
        });
      });
    }
    else{
      viewModel.checkCode(code).then((responseScan) {
        if (responseScan != null) {
          showDialog(context: context, builder: (context) => DialogScanConfirm(code, responseScan)).then((value) {
            Future.delayed(Duration(seconds: 1), () {
              isContinueScan = false;
            });
            if (value == true) {
              sendCodeToServer(code);
            }
          });
        }
      });
    }
  }

  void sendCodeToServer(String barcodeScanRes) {
    final viewModel = context.read(scanCodeViewModel);
    viewModel.sendQrCode(barcodeScanRes).then((responseScan) {
      if (responseScan != null) {
        viewModel.reloadUserNewPoint();
        showDialog(context: context, builder: (context) => DialogScanSuccess(responseScan));
      }
    });
  }
}
