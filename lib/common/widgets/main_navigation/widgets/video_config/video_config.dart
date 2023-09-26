import 'package:flutter/widgets.dart';

class VideoConfigData extends InheritedWidget {
  final bool autoMute;

  final void Function() toggleMuted;

  const VideoConfigData({
    super.key,
    required this.toggleMuted,
    required this.autoMute,
    required super.child,
  });

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class VideoConfig extends StatefulWidget {
  final Widget child;

  const VideoConfig({
    super.key,
    required this.child,
  });

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
  bool autoMute = false;

  void toggleMuted() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
      toggleMuted: toggleMuted,
      autoMute: autoMute,
      child: widget.child,
    );
  }
}

// 데이터는 stateful 위젯에서 관리하고,
// inheritedWidget에서는 데이터를 공유하는 역할만 한다.

//main에서 VideoConfig로 감싸주면 inheritedWidget에서 공유하는 데이터를 기반으로 Stateful Widget이 rebuild를 해줄것

// Positioned(
//   left: 20,
//   top: 40,
//   child: IconButton(
//     icon: FaIcon(
//       VideoConfig.of(context).autoMute
//           ? FontAwesomeIcons.volumeOff
//           : FontAwesomeIcons.volumeHigh,
//       color: Colors.white,
//     ),
//     onPressed: () {},
//   ),
// ),

