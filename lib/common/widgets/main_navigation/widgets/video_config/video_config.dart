import 'package:flutter/widgets.dart';

class VideoConfig extends ChangeNotifier {
  bool autoMute = false;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();


//bool _autoMute = videoConfig.autoMute;
//  videoConfig.addListener(() {
//    setState(() {
//      _autoMute = videoConfig.autoMute;
//    });
//  });
//}