import 'package:flutter/cupertino.dart';

class RadioButtonCustom extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Widget selectedIcon;
  final Widget unselectedIcon;
  final TextStyle? textStyle;

  RadioButtonCustom(
      {required this.text,
      required this.isSelected,
      required this.selectedIcon,
      required this.unselectedIcon,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          isSelected ? selectedIcon : unselectedIcon,
          Container(
            height: 50.0,
            width: 50.0,
            child: new Center(child: new Text(text, style: textStyle)),
          )
        ],
      ),
    );
  }
}
