import 'package:flutter/material.dart';

class BasePageRoute<T> extends MaterialPageRoute<T> {
  BasePageRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // if (settings.name == Constants.pageHomeCustomer) {
    //   return child;
    // }

    // return FadeTransition(opacity: animation, child: child);

    var begin = const Offset(1.0, 0.0);
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );

    // final Animation<Offset> _offsetAnimation = Tween<Offset>(
    //   begin: Offset.zero,
    //   end: const Offset(1.5, 0.0),
    // ).animate(animation);

    // return SlideTransition(position: _offsetAnimation, child: child,);
    // return new RotationTransition(
    //     turns: animation,
    //     child: new ScaleTransition(
    //       scale: animation,
    //       child: new FadeTransition(
    //         opacity: animation,
    //         child: child,
    //       ),
    //     ));
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(builder: builder, maintainState: maintainState, settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
