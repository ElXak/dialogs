import 'package:flutter/foundation.dart';

import '../locator.dart';
import '../services/dialog_service.dart';

class HomeViewModel extends ChangeNotifier {
  final DialogService _dialogService = locator<DialogService>();

  Future doThings() async {
    print('dialog shown');
    var dialogResult = await _dialogService.showDialog(
        title: 'Dialog Manager',
        description: 'FilledStacks architecture is always awesome');

    if (dialogResult.confirmed)
      print('User has confirmed');
    else
      print('User has canceled');
  }
}
