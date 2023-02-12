import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app_textstyle.dart';
import 'custom_dropdown_button.dart';

class DropdownContainer extends StatefulWidget {
  final Widget child;
  final List<String>? menuList;
  final ValueChanged<String?>? onMenuSelected;

  double? width;
  bool? isShowMenuOnLongPress = false;
  GestureTapCallback? onTap;
  GestureLongPressCallback? onLongPress;

  DropdownContainer({
    Key? key,
    required this.child,
    this.onMenuSelected,
    this.menuList,
    this.width,
    this.onTap,
    this.onLongPress,
    this.isShowMenuOnLongPress
  }) : super(key: key);

  @override
  DropdownContainerState createState() => DropdownContainerState();
}

class DropdownContainerState<T> extends State<DropdownContainer> {
  final GlobalKey<CustomDropdownButtonState> dropdownKey = GlobalKey<CustomDropdownButtonState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onLongPress: () {
        if (widget.isShowMenuOnLongPress == true) {
          dropdownKey.currentState?.callTap();
        }
        widget.onLongPress?.call();
      },
      child: Stack(
        children: [
          Container(
              width: widget.width,
              child: HookBuilder(builder: (_) {
                if (widget.menuList == null || widget.menuList!.isEmpty) return SizedBox();
                return CustomDropdownButton<String>(
                  key: dropdownKey,
                  iconSize: 0,
                  elevation: 16,
                  style: styleTextBlack(),
                  underline: SizedBox(),
                  onChanged: (String? t) {
                    widget.onMenuSelected?.call(t);
                  },
                  items: widget.menuList!.map<CustomDropdownMenuItem<String>>((String value) {
                    return CustomDropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
              })),
          widget.child
        ],
      ),
    );
  }

  void showMenu() {
    dropdownKey.currentState?.callTap();
  }
}
