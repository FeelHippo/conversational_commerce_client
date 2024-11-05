import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/widgets/circular_progress_bar.dart';

class ModalProgressHUD extends StatelessWidget {
  const ModalProgressHUD({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.dismissible = false,
    this.delay,
    required this.child,
  }) : super(key: key);
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final bool dismissible;
  final Widget child;
  final Duration? delay;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[child];
    if (inAsyncCall) {
      const Widget layOutProgressIndicator = Positioned.fill(
        child: Center(child: CircularProgressBar()),
      );
      final List<Widget> modal = <Widget>[
        Positioned.fill(
          child: Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: dismissible, color: color),
          ),
        ),
        layOutProgressIndicator
      ];
      if (delay != null) {
        modal.add(
          DelayedFadeWidget(
            delay: delay!,
            child: Stack(
              children: modal,
            ),
          ),
        );
      } else {
        widgetList += modal;
      }
    }
    return Stack(
      children: widgetList,
    );
  }
}

class DelayedFadeWidget extends StatefulWidget {
  const DelayedFadeWidget(
      {super.key, required this.delay, required this.child});
  final Widget child;
  final Duration delay;

  @override
  _DelayedFadeWidgetState createState() => _DelayedFadeWidgetState();
}

class _DelayedFadeWidgetState extends State<DelayedFadeWidget>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _timer = Timer(widget.delay, () {
      _fadeAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimationController,
      child: widget.child,
    );
  }
}
