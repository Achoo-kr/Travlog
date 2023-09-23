import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.num,
    required this.type,
  });

  final String num;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          num,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Text(
          type,
          style: TextStyle(color: Colors.grey.shade500),
        )
      ],
    );
  }
}
