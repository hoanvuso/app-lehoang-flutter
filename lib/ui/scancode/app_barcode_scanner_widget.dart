import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_grey.dart';
import 'package:flutter_lehoang_extracare/resources/component/button/button_solid.dart';
import 'package:flutter_lehoang_extracare/utils/util/alert_util.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late String _label;
late Function(String result) _resultCallback;

///
/// AppBarcodeScannerWidget
class AppBarcodeScannerWidget extends StatefulWidget {
  ///
  ///
  AppBarcodeScannerWidget.defaultStyle({
    Function(String result)? resultCallback,
    String label = 'Code',
  }) {
    _resultCallback = resultCallback ?? (String result) {};
    _label = label;
  }

  @override
  _AppBarcodeState createState() => _AppBarcodeState();
}

class _AppBarcodeState extends State<AppBarcodeScannerWidget> {
  @override
  Widget build(BuildContext context) {
    return _BarcodePermissionWidget();
  }
}

class _BarcodePermissionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BarcodePermissionWidgetState();
  }
}

class _BarcodePermissionWidgetState extends State<_BarcodePermissionWidget> {
  bool _isGranted = false;

  bool _useCameraScan = true;

  String _inputValue = "";

  @override
  void initState() {
    super.initState();
  }

  void _requestMobilePermission() async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      setState(() {
        _isGranted = true;
      });
    } else if (status == PermissionStatus.denied) {
      showErrorToast(context: context, message: "Ứng dụng cần cấp quyền Camera để hoạt động tính năng này");
      // await openAppSettings();
    } else if (status == PermissionStatus.permanentlyDenied) {
      showErrorToast(context: context, message: "Ứng dụng cần cấp quyền Camera để hoạt động tính năng này");
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    TargetPlatform platform = Theme.of(context).platform;
    if (!kIsWeb) {
      if (platform == TargetPlatform.android || platform == TargetPlatform.iOS) {
        _requestMobilePermission();
      } else {
        setState(() {
          _isGranted = true;
        });
      }
    } else {
      setState(() {
        _isGranted = true;
      });
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: _isGranted
              ? _useCameraScan
                  ? _BarcodeScannerWidget()
                  : _BarcodeInputWidget.defaultStyle(
                      changed: (String value) {
                        _inputValue = value;
                      },
                    )
              : Center(
                  child: OutlineButton(
                    onPressed: () {
                      _requestMobilePermission();
                    },
                    child: Text("Cấp quyền"),
                  ),
                ),
        ),
        if (_useCameraScan)
          SizedBox()
          // OutlineButton(
          //   onPressed: () {
          //     setState(() {
          //       _useCameraScan = false;
          //     });
          //   },
          //   child: Text("Nhập code"),
          // )
        else
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: ButtonGrey(
                      text: "Quay lại",
                      onPress: () {
                        setState(() {
                          _useCameraScan = true;
                        });
                      }),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ButtonSolid(
                      text: "Đồng ý",
                      onPress: () {
                        _resultCallback(_inputValue);
                      }),
                )
              ],
            ),
          ),
      ],
    );
  }
}

class _BarcodeInputWidget extends StatefulWidget {
  late ValueChanged<String> _changed;

  _BarcodeInputWidget.defaultStyle({
    required ValueChanged<String> changed,
  }) {
    _changed = changed;
  }

  @override
  State<StatefulWidget> createState() {
    return _BarcodeInputState();
  }
}

class _BarcodeInputState extends State<_BarcodeInputWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(8)),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8)),
            Text(
              "$_label：",
            ),
            Expanded(
              child: TextFormField(
                controller: _controller,
                onChanged: widget._changed,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
          ],
        ),
        Padding(padding: EdgeInsets.all(8)),
      ],
    );
  }
}

///ScannerWidget
class _BarcodeScannerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppBarcodeScannerWidgetState();
  }
}

class _AppBarcodeScannerWidgetState extends State<_BarcodeScannerWidget> {
  late ScannerController _scannerController;

  @override
  void initState() {
    super.initState();

    _scannerController = ScannerController(scannerResult: (result) {
      _resultCallback(result);

      _scannerController.stopCameraPreview();
      _scannerController.startCameraPreview();

    }, scannerViewCreated: () {
      TargetPlatform platform = Theme.of(context).platform;
      if (TargetPlatform.iOS == platform) {
        Future.delayed(Duration(seconds: 2), () {
          _scannerController.startCamera();
          _scannerController.startCameraPreview();
        });
      } else {
        _scannerController.startCamera();
        _scannerController.startCameraPreview();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scannerController.stopCameraPreview();
    _scannerController.stopCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
              child: LoadingWave()),
        ),
        Positioned.fill(
          child: _getScanWidgetByPlatform(),
        ),
      ],
    );
    // return Column(
    //   children: <Widget>[
    //     Expanded(
    //       child: _getScanWidgetByPlatform(),
    //     )
    //   ],
    // );
  }

  Widget _getScanWidgetByPlatform() {
    return PlatformAiBarcodeScannerWidget(
      platformScannerController: _scannerController,
    );
  }
}
