import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityInput extends StatefulWidget {
  final num value;
  final num min;
  final num max;
  final num step;
  final double iconSize;
  final ValueChanged<num>? onChanged;
  final NumberFormat? displayFormat;
  final Icon subtractIcon;
  final Icon addIcon;
  final EdgeInsetsGeometry iconPadding;
  final TextStyle textStyle;
  final Color? iconActiveColor;
  final Color? iconDisabledColor;
  final bool enabled;


  // QuantityInput(
  //     this.value,
  //     this.min,
  //     this.max,
  //     this.step,
  //     this.iconSize,
  //     this.onChanged,
  //     this.displayFormat,
  //     this.subtractIcon,
  //     this.addIcon,
  //     this.iconPadding,
  //     this.textStyle,
  //     this.iconActiveColor,
  //     this.iconDisabledColor,
  //     this.enabled);

  QuantityInput({
    this.value = 1.0,
    this.onChanged,
    this.min = 1.0,
    this.max = 9999999.0,
    this.step = 1.0,
    this.iconSize = 20.0,
    this.displayFormat,
    this.subtractIcon = const Icon(Icons.remove),
    this.addIcon = const Icon(Icons.add),
    this.iconPadding = const EdgeInsets.all(4.0),
    this.textStyle = const TextStyle(fontSize: 24),
    this.iconActiveColor,
    this.iconDisabledColor,
    this.enabled = true,
  });

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  num _value = 0;

  bool get minusBtnDisabled =>
      _value <= widget.min ||
          _value - widget.step < widget.min ||
          !widget.enabled;

  bool get addBtnDisabled =>
      _value >= widget.max ||
          _value + widget.step > widget.max ||
          !widget.enabled;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  Color? _spinButtonColor(bool btnDisabled) => btnDisabled
      ? widget.iconDisabledColor ?? Theme.of(context).disabledColor
      : widget.iconActiveColor ?? Theme.of(context).textTheme.button?.color;

  void _adjustValue(num adjustment) {
    num newVal = _value + adjustment;
    setState(() {
      _value = newVal;
    });
    widget.onChanged?.call(newVal);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          padding: widget.iconPadding,
          iconSize: widget.iconSize,
          color: _spinButtonColor(minusBtnDisabled),
          icon: widget.subtractIcon,
          onPressed: minusBtnDisabled ? null : () => _adjustValue(-widget.step),
        ),
        Text(
          widget.displayFormat == null
              ? _value.toString()
              : widget.displayFormat!.format(_value),
          style: widget.textStyle,
        ),
        IconButton(
          padding: widget.iconPadding,
          iconSize: widget.iconSize,
          color: _spinButtonColor(addBtnDisabled),
          icon: widget.addIcon,
          onPressed: addBtnDisabled ? null : () => _adjustValue(widget.step),
        ),
      ],
    );
  }
}