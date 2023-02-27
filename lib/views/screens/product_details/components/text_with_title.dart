import 'package:flutter/material.dart';
import 'package:grocery_app/constant/my_colors.dart';

class TextWithTitle extends StatelessWidget {
  const TextWithTitle(
      {super.key,
      required this.title,
      required this.value,
      this.isTextEllipsis = false});
  final String title;
  final String value;
  final bool isTextEllipsis;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 12,
                color: MyColors.deepGrey,
                overflow: TextOverflow.ellipsis),
            softWrap: false),
        SizedBox(
          width: isTextEllipsis ? 60 : null,
          child: Text(value,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 12,
                  color: MyColors.deep,
                  overflow: TextOverflow.ellipsis),
              softWrap: false),
        ),
      ],
    );
  }
}
