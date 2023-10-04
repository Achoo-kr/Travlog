import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  final PlaybackConfigRepository _repository;

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    // 유저가 저장한 값을 disk에 넣어줌
    _repository.setMuted(value);
    // state.muted = value; 처럼 state를 바꾸는 식으로 하지않고 state를 새로운 state로 대체해야한다
    state = PlaybackConfigModel(
      muted: value,
      autoplay: state.autoplay,
    );
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModel(
      muted: state.muted,
      autoplay: value,
    );
  }

// 빌드 메서드 = 노티파이어가 노출할 데이터를 제공하는 방법, initialState들이지만 곧 변할거라는거임
  @override
  PlaybackConfigModel build() {
    return PlaybackConfigModel(
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    );
  }
}

//컨피그 뷰모델이 바뀌는 걸 감지하고 컨피그 모델이라는 데이터를 보여줄 것임
//<방출하고 싶은 프로바이더, 프로바이더가 방출할 데이터>
//throw하고 메인에서 override하는 부부분은 안봐도 됌 임시로 해놓은 거임
final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
  () => throw UnimplementedError(),
);
