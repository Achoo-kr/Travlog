import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  //탭 컨트롤러에 Ticker를 제공하기위해 => 탭 상태가 변경될 때를 Listening하기 위함
  late TabController _tabController;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  // final TextEditingController _textEditingController =
  //     TextEditingController(text: "Initial Text");

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    if (value.isNotEmpty) {
      print(value);
    }
  }

  // void _onGoBackHistory() {
  //   //pushReplacement 기존 루트를 버리고 push 시켜줌
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //     builder: (context) => const MainNavigationScreen(),
  //   ));
  // }

  //PageRouteBuilder를 사용해 페이지 전환 애니메이션을 커스터마이즈
  void _onGoBackHistory() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MainNavigationScreen(),
        transitionDuration: const Duration(milliseconds: 150), //애니메이션 속도
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(-1.0, 0.0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void _hideKeyBoardWhenTapChanged() {
    if (_tabController.indexIsChanging) {
      FocusScope.of(context).unfocus();
    }
  }

  void _onTapXmark() {
    _textEditingController.clear();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this, // SingleTickerProviderStateMixin 제공
    );
    _tabController.addListener(_hideKeyBoardWhenTapChanged);
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.removeListener(_hideKeyBoardWhenTapChanged);
    _tabController.dispose();
    _focusNode.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    //No tap controller 문제 => DefaultTabController
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          // title: CupertinoSearchTextField(
          //   controller: _textEditingController,
          //   onChanged: _onSearchChanged,
          //   onSubmitted: _onSearchSubmitted,
          // ),
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size2,
              vertical: Sizes.size4,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _onGoBackHistory,
                  child: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: Sizes.size24,
                  ),
                ),
                Gaps.h10,
                Expanded(
                  child: SizedBox(
                    width: width,
                    height: Sizes.size48,
                    child: TextField(
                      autocorrect: false,
                      onSubmitted: _onSearchSubmitted,
                      onChanged: _onSearchChanged,
                      focusNode: _focusNode,
                      controller: _textEditingController,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.size10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size10,
                          vertical: Sizes.size10,
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 10,
                        ),
                        suffixIcon: _focusNode.hasFocus
                            ? GestureDetector(
                                onTap: _onTapXmark,
                                child: const FaIcon(
                                  FontAwesomeIcons.solidCircleXmark,
                                  color: Colors.grey,
                                  size: Sizes.size24,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                Gaps.h10,
                const FaIcon(
                  FontAwesomeIcons.sliders,
                  size: Sizes.size24,
                )
              ],
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: GestureDetector(
          //스크롤 뿐만 아니라 터치일 때도 dismiss하도록
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _focusNode.unfocus();
          },
          child: TabBarView(
            controller: _tabController,
            children: [
              //GridView도 PageView처럼 builder로 쓰는게 더 좋은 성능을 가지고 있음
              GridView.builder(
                //스크롤 시에 키보드 Dismiss
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                padding: const EdgeInsets.all(
                  Sizes.size6,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 18,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 13,
                        child: FadeInImage.assetNetwork(
                            placeholderFit: BoxFit.cover,
                            fit: BoxFit.cover,
                            placeholder: "assets/images/placeholder.jpg",
                            image:
                                "https://media.istockphoto.com/id/944812540/ko/%EC%82%AC%EC%A7%84/%EC%82%B0-%ED%94%84%EB%A6%AC-%ED%8F%B0-%ED%83%80-%EB%8D%B8%EA%B0%80-%EB%8B%A4-%EC%84%AC-%EC%95%84%EC%A1%B0%EB%A0%88%EC%8A%A4-%EC%A0%9C%EB%8F%84.jpg?s=612x612&w=0&k=20&c=DQJ6eA0Wnxqt1yDdJChcoyuJ_5r0IQBduoIFZY0QV78="),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a very long caption for my tiktok that im upload just now currently.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v8,
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/64416520?v=4"),
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              "FeathersMcGraw",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h2,
                          const Text(
                            "2.5M",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
