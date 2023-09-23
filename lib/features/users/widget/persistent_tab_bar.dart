import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: const TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.symmetric(vertical: Sizes.size10),
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: FaIcon(FontAwesomeIcons.chessBoard),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: FaIcon(FontAwesomeIcons.heart),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
