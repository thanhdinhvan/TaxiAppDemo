import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Dialog(
              child: Container(
                color: null,
                height: 100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Text(
                        msg,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  static void hideLoadingDiaLog(BuildContext context) {
    Navigator.of(context).pop(LoadingDialog);
  }
}
