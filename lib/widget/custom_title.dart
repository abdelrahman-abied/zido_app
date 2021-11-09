import 'package:flutter/material.dart';
import 'package:zido_app/utils/components.dart';
import 'package:zido_app/utils/style.dart';

class ZidoTitle extends StatelessWidget {
  final String title;
  final Function() seeAllFunction;
  const ZidoTitle({
    Key? key,
    required this.title,
    required this.seeAllFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          GestureDetector(
            onTap: seeAllFunction,
            child: Text(
              getString(context, "seeAll"),
              style: const TextStyle(
                color: secondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
