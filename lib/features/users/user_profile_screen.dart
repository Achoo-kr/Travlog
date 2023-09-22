import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/widget/user_info.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('CHOO'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.gear),
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                foregroundColor: Colors.teal,
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/64416520?v=4"),
                child: Text('CHOO'),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "@CHOO",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: Sizes.size16),
                  ),
                  Gaps.h5,
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    size: Sizes.size16,
                    color: Colors.blue.shade500,
                  )
                ],
              ),
              Gaps.v24,
              SizedBox(
                height: Sizes.size48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const UserInfo(num: '97', type: 'Following'),
                    VerticalDivider(
                      width: 30,
                      thickness: 1,
                      color: Colors.grey.shade500,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                    ),
                    const UserInfo(num: "10.5M", type: "Followers"),
                    VerticalDivider(
                      width: 30,
                      thickness: 1,
                      color: Colors.grey.shade500,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                    ),
                    const UserInfo(num: "194.3M", type: "Likes")
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
