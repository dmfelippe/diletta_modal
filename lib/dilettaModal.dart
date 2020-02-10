import 'package:flutter/material.dart';
import 'package:diletta_modal/dilettaModals.dart';

class DilettaModal extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  final DilettaBasicModal dilettaModal;

  DilettaModal({this.dilettaModal});

  static Future<dynamic> openDilettaModal(BuildContext context, DilettaBasicModal dilettaModal) {
    return Navigator.of(context).push(DilettaModal(dilettaModal: dilettaModal));
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation) {
    return Material(
      type: MaterialType.transparency,
      child: this.dilettaModal
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}