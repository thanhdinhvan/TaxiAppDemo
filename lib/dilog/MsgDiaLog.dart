import 'package:flutter/material.dart';

class MSgDiaLog {
  static void showMSGDiaLog(BuildContext context, String title, String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(msg),
              actions: [
                FlatButton(
                    onPressed: () => {Navigator.of(context).pop(MSgDiaLog)},
                    child: Text("OK"))
              ],
            ));
  }
}
