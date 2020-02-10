import 'package:flutter/material.dart';

class DialogMixin {
  Future showDialogError(BuildContext context, String msg) =>
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Tente Novamente",
                ))
          ],
        );
      },
    );
  
}
