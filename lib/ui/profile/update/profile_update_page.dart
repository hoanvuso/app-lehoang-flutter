import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/model/auth/user.dart';
import 'package:flutter_lehoang_extracare/data/model/request/request_update_profile.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_container.dart';
import 'package:flutter_lehoang_extracare/resources/component/common/common_top_bar.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/date_picker_normal.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_config.dart';
import 'package:flutter_lehoang_extracare/resources/component/input/text_field_normal.dart';
import 'package:flutter_lehoang_extracare/ui/profile/update/profile_update_view_model.dart';
import 'package:flutter_lehoang_extracare/utils/util/time_util.dart';
import 'package:flutter_lehoang_extracare/utils/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'component/profile_update_image.dart';

class ProfileUpdatePage extends StatefulWidget {
  @override
  _ProfileUpdatePageState createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  User? user;
  TextEditingController nameTed = TextEditingController();
  TextEditingController phoneTed = TextEditingController();
  TextEditingController agentNameTed = TextEditingController();
  TextEditingController birthTed = TextEditingController();
  TextEditingController emailTed = TextEditingController();
  TextEditingController addressTed = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    user = context.read(prefsProvider).getUser();
    nameTed.text = user?.name ?? '';
    phoneTed.text = user?.username ?? '';
    agentNameTed.text = user?.agency_name ?? '';
    try {
      birthTed.text = DateFormat(DATE_FORMAT_4).format(DateFormat(DATE_FORMAT_1).parse(user!.birthday!));
    } catch (e) {}
    emailTed.text = user?.email ?? '';
    addressTed.text = user?.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorBackgroundDefault,
      body: BaseContainer(
          provider: profileUpdateViewModel,
          child: Column(
            children: [
              CommonTopbar('Thông tin tài khoản'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildImageProfileView(),
                              SizedBox(height: 5.h),
                              Divider(color: colorGrey),
                              SizedBox(height: 5.h),
                              TextFieldNormal(
                                controller: nameTed,
                                hintText: 'Nhập họ tên',
                                labelText: 'Họ tên',
                                labelStyle: styleTextGrey(),
                                borderType: BorderType.typeUnderLine,
                              ),
                              SizedBox(height: 10.h),
                              TextFieldNormal(
                                controller: phoneTed,
                                hintText: 'Nhập số điện thoại',
                                labelText: 'Số điện thoại',
                                labelStyle: styleTextGrey(),
                                borderType: BorderType.typeUnderLine,
                              ),
                              SizedBox(height: 10.h),
                              TextFieldNormal(
                                controller: agentNameTed,
                                hintText: 'Nhập tên đại lý',
                                labelText: 'Tên đại lý',
                                labelStyle: styleTextGrey(),
                                borderType: BorderType.typeUnderLine,
                              ),
                              SizedBox(height: 10.h),
                              DatePickerNormal(
                                controller: birthTed,
                                hintText: 'Nhập ngày sinh',
                                labelText: 'Ngày sinh',
                                labelStyle: styleTextGrey(),
                                borderType: BorderType.typeUnderLine,
                                onSelectedDate: (date) {},
                              ),
                              SizedBox(height: 10.h),
                              TextFieldNormal(
                                controller: emailTed,
                                hintText: 'Nhập email',
                                labelText: 'Email',
                                labelStyle: styleTextGrey(),
                                borderType: BorderType.typeUnderLine,
                              ),
                              SizedBox(height: 10.h),
                              TextFieldNormal(
                                controller: addressTed,
                                hintText: 'Nhập địa chỉ',
                                labelText: 'Địa chỉ',
                                labelStyle: styleTextGrey(),
                                borderType: BorderType.typeUnderLine,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildBottomButton()
            ],
          )),
    );
  }

  Widget _buildImageProfileView() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          ClipOval(
            child: HookBuilder(
              builder: (_) {
                final imageLocal = useProvider(profileUpdateViewModel.select((value) => value.profileImage));
                return ProfileUpdateImage(
                  imageUrl: user?.avatarUrl,
                  imageLocal: imageLocal,
                );
              },
            ),
          ),
          SizedBox(width: 20.w),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: _getImageFromLocal,
              child: Container(
                decoration: decorOnlyBorder(color: colorGrey2, radius: 5.r),
                padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 7.h, bottom: 7.h),
                child: Text('Upload hình', style: styleTextPrimary()),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 13.h, top: 13.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.r),
        child: Material(
          color: colorPrimary,
          child: InkWell(
            onTap: _updateProfile,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 12.h, top: 12.h),
              child: Text(
                'Lưu thay đổi',
                style: styleTextWhiteBold(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _getImageFromLocal() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      context.read(profileUpdateViewModel).setProfileImage(File(pickedFile.path));
    }
  }

  void _updateProfile() {
    if (!(_formKey.currentState?.validate() == true)) return;
    final viewModel = context.read(profileUpdateViewModel);

    final request = RequestUpdateProfile(
      name: nameTed.text,
      phone: phoneTed.text,
      address: addressTed.text,
      email: emailTed.text,
      agency_name: agentNameTed.text,
      birthday: DateFormat(DATE_FORMAT_1).format(DateFormat(DATE_FORMAT_4).parse(birthTed.text)),
    );

    if (viewModel.profileImage != null) {
      viewModel.doWithLoadingMulti([viewModel.updateProfileImage(), viewModel.updateProfile(request)]).then((value) {
        if (value == null) return;
        final listResponse = value as List;
        if (listResponse.length == 2 && listResponse[0] != null && listResponse[1] != null) {
          showSuccessToast(context: context, message: 'Cập nhật thành công');
          Navigator.pop(context);
        }
      });
    } else {
      viewModel.doWithLoading(viewModel.updateProfile(request)).then((value) {
        if (value != null) {
          showSuccessToast(context: context, message: 'Cập nhật thành công');
          Navigator.pop(context);
        }
      });
    }
  }
}
