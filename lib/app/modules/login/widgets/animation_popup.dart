import 'package:cinemark_fake/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class AnimationPopup extends StatefulWidget {

  final Widget child;
  final ObservableValue<bool> isShow;

  const AnimationPopup({Key key, this.isShow, @required this.child}) : super(key: key);

  @override
  _AnimationPopupState createState() => _AnimationPopupState();
}

class _AnimationPopupState extends State<AnimationPopup> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation<Offset> animation;
  ReactionDisposer disposer;

  final LoginController controller = Modular.get();

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    animation = Tween<Offset>(
      begin: Offset(0, -1.2),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.decelerate,
      ),
    );
    disposer = autorun((reaction) {
      if (widget.isShow.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    disposer.call();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}