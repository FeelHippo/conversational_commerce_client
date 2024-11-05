import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/widgets/app_scaffold.dart';

class SnackBarHandler {
  SnackBarHandler(this.context);
  final BuildContext context;

  void showFeedback(String text, {AppSnackBarSeverity? severity}) {
    AppScaffold.of(context)?.showSnackBar(
      AppSnackBar(
        content: Text(text),
        severity: severity,
      ),
    );
  }
}

mixin SnackBarMixin {
  void showSnackBar({
    required String message,
    required BuildContext context,
    bool isError = true,
    bool isBottomPadding = true,
    bool isSnackBarHandler = false,
  }) {
    if (isSnackBarHandler) {
      SnackBarHandler(context).showFeedback(
        message,
        severity:
            isError ? AppSnackBarSeverity.error : AppSnackBarSeverity.success,
      );
    } else {
      AppScaffold.of(context, nullOk: true)?.showSnackBar(
        AppSnackBar(
          content: Text(message),
          isBottomPadding: isBottomPadding,
          severity:
              isError ? AppSnackBarSeverity.error : AppSnackBarSeverity.success,
        ),
      );
    }
  }
}
