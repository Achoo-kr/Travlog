import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widget/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/users/widget/user_info.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('CHOO'),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(FontAwesomeIcons.gear),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: width < Breakpoints.md
                      ? Column(
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
                                      fontWeight: FontWeight.w600,
                                      fontSize: Sizes.size16),
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
                                  const UserInfo(
                                      num: "10.5M", type: "Followers"),
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
                            ),
                            Gaps.v14,
                            FractionallySizedBox(
                              widthFactor: 0.66,
                              child: Row(
                                children: [
                                  //Flexible = 공간에서 비율을 얼마나 차지할지
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 4,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: Sizes.size12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(Sizes.size4),
                                        ),
                                      ),
                                      child: const Text(
                                        'Follow',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Gaps.h5,
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: Sizes.size9,
                                        horizontal: Sizes.size11,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(Sizes.size4),
                                        ),
                                      ),
                                      child: FaIcon(
                                        FontAwesomeIcons.youtube,
                                        size: Sizes.size20,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ),
                                  Gaps.h5,
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: Sizes.size9,
                                        horizontal: Sizes.size11,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(Sizes.size4),
                                        ),
                                      ),
                                      child: FaIcon(
                                        FontAwesomeIcons.caretDown,
                                        size: Sizes.size20,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gaps.v14,
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.size32,
                              ),
                              child: Text(
                                "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Gaps.v14,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.link,
                                  size: Sizes.size12,
                                ),
                                Gaps.h4,
                                Text(
                                  "https://nomadcoders.co",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v20,
                          ],
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      foregroundColor: Colors.teal,
                                      foregroundImage: NetworkImage(
                                          "https://avatars.githubusercontent.com/u/64416520?v=4"),
                                      child: Text("CHOO"),
                                    ),
                                  ],
                                ),
                                Gaps.h60,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "@CHOO",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Sizes.size18,
                                          ),
                                        ),
                                        Gaps.h8,
                                        FaIcon(
                                          FontAwesomeIcons.solidCircleCheck,
                                          size: Sizes.size16,
                                          color: Colors.blue.shade500,
                                        )
                                      ],
                                    ),
                                    Gaps.v24,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const UserInfo(
                                            num: '97', type: 'Following'),
                                        VerticalDivider(
                                          width: Sizes.size32,
                                          thickness: Sizes.size1,
                                          color: Colors.grey.shade500,
                                          indent: Sizes.size12,
                                          endIndent: Sizes.size12,
                                        ),
                                        const UserInfo(
                                            num: "10.5M", type: "Followers"),
                                        VerticalDivider(
                                          width: Sizes.size32,
                                          thickness: Sizes.size1,
                                          color: Colors.grey.shade500,
                                          indent: Sizes.size12,
                                          endIndent: Sizes.size12,
                                        ),
                                        const UserInfo(
                                            num: "194.3M", type: "Likes")
                                      ],
                                    ),
                                  ],
                                ),
                                Gaps.h80,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Gaps.h10,
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.0,
                                            color: Colors.grey.shade500,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(Sizes.size3),
                                          ),
                                        ),
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.youtube,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gaps.h10,
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.0,
                                            color: Colors.grey.shade500,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(Sizes.size3),
                                          ),
                                        ),
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.caretDown,
                                            size: Sizes.size16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Gaps.v40,
                            FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size12,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      Sizes.size4,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Follow",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Gaps.v40,
                            const Text(
                              "All highlights and where to watch live matches on FIFA+",
                              textAlign: TextAlign.center,
                            ),
                            Gaps.v14,
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.link,
                                  size: Sizes.size12,
                                ),
                                Gaps.h4,
                                Text(
                                  "https://nomadcoders.co",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v40,
                          ],
                        ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 14,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: "assets/images/placeholder.jpg",
                              image:
                                  "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                            ),
                          ),
                          const Positioned(
                            left: 3,
                            bottom: 3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.circlePlay,
                                  size: Sizes.size16,
                                  color: Colors.white,
                                ),
                                Gaps.h4,
                                Text(
                                  '4.1M',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text("d"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
