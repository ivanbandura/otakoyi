import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String assetName;
  const Avatar({Key key, this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: [4],
      color: Colors.amber,
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: Radius.circular(30),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(assetName),
        ),
      ),
    );
  }
}
