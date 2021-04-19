import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Center(
            child: TextButton(
              child: Text('Show Dialog'),
              onPressed: () {
                model.doThings();
              },
            ),
          ),
        ),
      ),
    );
  }
}
