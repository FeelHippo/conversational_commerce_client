import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/widgets/app_scaffold.dart';
import 'package:stadtplan/presentation/widgets/textlabels/text_header1.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    this.child,
  });
  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        body: Column(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints(minHeight: 138),
              child: Center(
                child: TextHeader1(
                  text: title,
                  isTextBold: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}
