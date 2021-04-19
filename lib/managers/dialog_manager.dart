import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../data_models/alert_request.dart';
import '../data_models/alert_response.dart';
import '../locator.dart';
import '../services/dialog_service.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({Key key, this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    Alert(
        context: context,
        title: request.title,
        desc: request.description,
        closeFunction: () {
          _dialogService.dialogComplete(AlertResponse(confirmed: false));
          Navigator.of(context).pop();
        },
        buttons: [
          DialogButton(
              child: Text(request.buttonTitle),
              onPressed: () {
                _dialogService.dialogComplete(AlertResponse(confirmed: true));
                Navigator.of(context).pop();
              }),
        ]).show();
  }
}
