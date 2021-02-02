import 'package:flutter/material.dart';
import 'package:otakoyi/widgets/app_bar.dart';
import 'package:otakoyi/widgets/bottom_navigation_bar.dart';

class ScreenTemplate extends StatelessWidget {
  final Widget body;
  const ScreenTemplate({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: body,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
