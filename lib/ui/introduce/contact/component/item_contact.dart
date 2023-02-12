import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lehoang_extracare/data/model/support/contact.dart';
import 'package:flutter_lehoang_extracare/gen/assets.gen.dart';
import 'package:flutter_lehoang_extracare/resources/app_colors.dart';
import 'package:flutter_lehoang_extracare/resources/app_decorations.dart';
import 'package:flutter_lehoang_extracare/resources/app_textstyle.dart';
import 'package:flutter_lehoang_extracare/utils/util/launcher_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemContact extends StatelessWidget {
  Contact? contact;

  ItemContact(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorSolidRound(circularSize: 7.r, color: Colors.white),
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.w),
            child: Text(contact?.name ?? '', style: styleTextBlackBold(17)),
          ),
          SizedBox(height: 5.h),
          Divider(color: colorGrey),
          Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Assets.images.icContactCskh.image(width: 20.h, height: 20.h, color: Colors.black),
                    SizedBox(width: 7.w),
                    Text('Tổng đài CSKH:', style: styleTextBlack()),
                    SizedBox(width: 7.w),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            openPhoneDial(contact?.hot_line ?? '');
                          },
                          child: Text(contact?.hot_line ?? '', style: styleTextBlue())),
                    ),
                  ],
                ),
                _buildSpaceDivide(),
                Row(
                  children: [
                    Assets.images.icContactEmail.image(width: 20.h, height: 20.h, color: Colors.black),
                    SizedBox(width: 7.w),
                    Text('Email:', style: styleTextBlack()),
                    SizedBox(width: 7.w),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              openEmail(contact?.email ?? '');
                            },
                            child: Text(contact?.email ?? '', style: styleTextBlue()))),
                  ],
                ),
                _buildSpaceDivide(),
                Row(
                  children: [
                    Assets.images.icContactFacebook.image(width: 20.h, height: 20.h, color: Colors.black),
                    SizedBox(width: 7.w),
                    Text('Facebook:', style: styleTextBlack()),
                    SizedBox(width: 7.w),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              openFacebook(contact?.facebook ?? '');
                            },
                            child: Text(contact?.facebook ?? '', style: styleTextBlue()))),
                  ],
                ),
                _buildSpaceDivide(),
                Row(
                  children: [
                    Assets.images.icContactYoutube.image(width: 20.h, height: 20.h, color: Colors.black),
                    SizedBox(width: 7.w),
                    Text('YouTube:', style: styleTextBlack()),
                    SizedBox(width: 7.w),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              openFacebook(contact?.youtube ?? '');
                            },
                            child: Text(contact?.youtube ?? '', style: styleTextBlue()))),
                  ],
                ),
                SizedBox(height: 10.h),
                contact?.descriptions != null ? Text(contact?.descriptions ?? "", style: styleTextBlack()) : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSpaceDivide() {
    return Column(
      children: [
        SizedBox(height: 3.h),
        Divider(color: colorGrey2),
        SizedBox(height: 3.h),
      ],
    );
  }
}
