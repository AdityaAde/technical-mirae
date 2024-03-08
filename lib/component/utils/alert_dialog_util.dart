// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class AlertDialogUtil {
  static Future<void> showMyDialog(
    BuildContext context, {
    Widget? title,
    Widget? body,
    bool isDelayed = false,
  }) async {
    final dialog = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      content: SizedBox(
        height: 170,
        child: Column(
          children: <Widget>[
            title ?? const SizedBox(),
            const SizedBox(height: 30),
            body ?? const SizedBox(),
          ],
        ),
      ),
    );

    showDialog<void>(
      useRootNavigator: false,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
    if (isDelayed) {
      // Tunggu selama 2 detik dan tutup AlertDialog
      await Future.delayed(const Duration(milliseconds: 1500));
      Navigator.of(context).pop(); // Tutup dialog
    }
  }
}
