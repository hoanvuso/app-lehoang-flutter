import 'package:flutter/cupertino.dart';

class ContainerLoading extends StatefulWidget {
  final Widget loadingView;
  final Widget child;
  bool isLoadSuccess = false;

  ContainerLoading({required this.loadingView, required this.child, required this.isLoadSuccess});

  @override
  _ContainerLoadingState createState() => _ContainerLoadingState();
}

class _ContainerLoadingState extends State<ContainerLoading> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
            child: !widget.isLoadSuccess ? widget.loadingView : const SizedBox(),
            duration: const Duration(milliseconds: 200)),
        AnimatedOpacity(
            opacity: widget.isLoadSuccess ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: widget.isLoadSuccess ? widget.child : const SizedBox())
      ],
    );
  }
}
