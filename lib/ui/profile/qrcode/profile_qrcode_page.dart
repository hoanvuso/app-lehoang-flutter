import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile_image.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/ui/profile/qrcode/profile_qrcode_view_model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileQrCodePage extends StatefulWidget {
  @override
  _ProfileQrCodePageState createState() => _ProfileQrCodePageState();
}

class _ProfileQrCodePageState extends State<ProfileQrCodePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = context.read(prefsProvider).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorBackgroundDefault,
      body: BaseContainer(
          provider: profileQrCodeViewModel,
          child: Column(
            children: [
              CommonTopbar('QR Code của tôi'),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: QrImage(
                      data: user?.username ?? 'Không có username',
                      version: QrVersions.auto,
                      size: 0.8.sw,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
