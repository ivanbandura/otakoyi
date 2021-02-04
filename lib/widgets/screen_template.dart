import 'package:flutter/material.dart';
import 'package:otakoyi/widgets/custom_app_bar.dart';
import 'package:otakoyi/widgets/custom_bottom_bar.dart';

class ScreenTemplate extends StatelessWidget {
  final Widget body;
  final int index;
  const ScreenTemplate({Key key, this.body, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: body,
      bottomNavigationBar: CustomBottomNavigationBar(
        index: index,
      ),
    );
  }
}
