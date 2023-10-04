import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  List<VideoModel> _list = [
    // VideoModel(title: "video"),
  ];

  Future<void> uploadVideo() async {
    state = const AsyncValue.loading(); // 뷰모델을 로딩상태로 만들기
    await Future.delayed(const Duration(seconds: 2));
    final newVideo = VideoModel(title: "${DateTime.now()}");
    //기존에 있는걸 갈아끼워야하기 때문에 add가 아니라 새로 할당해준다
    _list = [..._list, newVideo];
    state = AsyncValue.data(_list);
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    await Future.delayed(const Duration(seconds: 5));
    return _list;
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
