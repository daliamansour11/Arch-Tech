import 'package:archtech/core/error/error_dialog.dart';
import 'package:flutter/material.dart';

extension Dialogs on BuildContext {
  get loadingDialog => openDialog(
        const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
  openDialog(Widget dialog, {bool barrierDismissible = true}) => showDialog(
        context: this,
        barrierDismissible: barrierDismissible,
        builder: (context) => dialog,
      );
  errorDialog(String message, {String? title}) => openDialog(
        MyAlertDialog(
          message: message,
          title: title,
        ),
      );
  successDialog(
    String message,
  ) =>
      openDialog(
        MyAlertDialog(
          message: message,
          title: '🎉 Success',
        ),
      );
}
