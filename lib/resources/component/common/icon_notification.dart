import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lehoang_extracare/data/broadcast/broadcast_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconNotification extends StatelessWidget {
  VoidCallback? onPress;

  IconNotification({this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress?.call();
      },
      child: SizedBox(
        width: 35.h,
        height: 40.h,
        child: HookBuilder(
          builder: (_) {
            var badge = useProvider(broadCastProvider.select((value) => value.badgeNotification));
            if (badge == null) badge = 0;
            return Stack(
              children: [
                Center(child: Icon(Icons.notifications_outlined, size: 30.h, color: Colors.white)),
                Positioned.fill(
                  top: 0.h,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Visibility(
                      visible: badge > 0,
                      child: ClipOval(
                        child: Container(
                          width: 20.h,
                          height: 20.h,
                          padding: const EdgeInsets.all(1),
                          color: Colors.white,
                          constraints: BoxConstraints(
                            minWidth: 10.h,
                            minHeight: 10.h,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                              '${badge == null ? 0 : badge > 99 ? '99+' : badge}',
                              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
