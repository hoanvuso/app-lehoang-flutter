import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class IconCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          InkWell(
            onTap: () {
              // Navigator.pushNamed(context, Constants.pageCart);
            },
            child: Icon(
              Icons.shopping_cart,
              size: 37.h,
              color: Colors.white,
            ),
          ),
          Positioned(
              child: ClipOval(
                child: Container(
                  color: Colors.red,
            width: 17.h,
            height: 17.h,
            alignment: Alignment.center,
            constraints: BoxConstraints(
                minWidth: 10.h,
                minHeight: 10.h,
            ),
            child: HookBuilder(
                builder: (context) {
                  final cartNumber = useProvider(broadCastProvider.select((value) => value.cartNumber));
                  return Text(
                      '${cartNumber == null ? 0 : cartNumber > 99 ? '99+' : cartNumber}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center);
                },
            ),
          ),
              ))
        ],
      ),
    );
  }
}
