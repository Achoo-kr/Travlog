import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  List<Color> colors = [
    Colors.blue,
    Colors.teal,
    Colors.yellow,
    Colors.pink,
  ];

  void _onPageChanged(int page) {
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll([
        Colors.blue,
        Colors.teal,
        Colors.yellow,
        Colors.pink,
      ]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    //ListView.builder, PageView.builder은 lazyVStack같이 천천히 렌더링
    return PageView.builder(
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
            child: Text(
          "$index",
          style: const TextStyle(fontSize: 60),
        )),
      ),
    );
  }
}
