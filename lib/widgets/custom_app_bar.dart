import 'package:flutter/material.dart';
import 'package:otakoyi/core/app_icons.dart';
import 'package:otakoyi/widgets/avatar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  final List<Widget> actions = [
    IconButton(
        icon: Icon(AppIcons.search, color: Colors.black54, size: 20),
        onPressed: () {}),
    IconButton(
      icon: Icon(AppIcons.app_bar_like, color: Colors.black54, size: 22),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(AppIcons.app_bar_cart, color: Colors.black54, size: 20),
      onPressed: () {},
    ),
    SizedBox(width: 6.0)
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Row(
          children: [
            SizedBox(width: 2),
            Avatar(assetName: 'assets/images/avatar.png'),
            SizedBox(width: 15.0),
            _AppLogo()
          ],
        ),
        actions: actions);
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Image.asset(
            'assets/images/logo.png',
            width: 55,
            height: 25,
          ),
        ),
        Text(
          'CLOTHES & MORE',
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 9.0,
              letterSpacing: 1.0),
        )
      ],
    );
  }
}
