import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';
import 'package:tiktok_clone/features/users/repos/user_repo.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    _userRepository = ref.read(userRepo);
    _authenticationRepository = ref.read(authRepo);

    if (_authenticationRepository.isLoggedIn) {
      final profile = await _userRepository
          .findProfile(_authenticationRepository.user!.uid);
      if (profile != null) {
        return UserProfileModel.fromJson(profile);
      }
    }
    return UserProfileModel.empty();
  }

  Future<void> createProfile(
      UserCredential credential, String name, String birthday) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }
    state = const AsyncValue.loading();
    final profile = UserProfileModel(
      hasAvatar: false,
      bio: "Describe yourself!",
      link: "your link to show",
      email: credential.user!.email ?? "anon@anon.com",
      uid: credential.user!.uid,
      name: name,
      birthday: birthday,
    );
    await _userRepository.createProfile(profile);
    state = AsyncValue.data(profile);
  }

  Future<void> onAvatarUpload() async {
    if (state.value == null) return;
    state = AsyncValue.data(state.value!.copyWith(hasAvatar: true));
    await _userRepository.updateUser(state.value!.uid, {"hasAvatar": true});
  }

  Future<void> updateProfile(String? bio, String? link) async {
    if (state.value == null) return;
    state = AsyncValue.data(state.value!.copyWith(bio: bio, link: link));
    await _userRepository
        .updateUser(state.value!.uid, {"bio": bio, "link": link});
  }
}

//UsersViewModel 클래스를 감싸는 AsyncNotifierProvider의 객체다
final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);

// AsyncValue는 비동기 데이터의 상태를 다루는 데에 중점을 두며,
// Notifier는 상태 관리와 UI 업데이트를 위한 클래스라는 차이점이 있다.

final userListProvider = StreamProvider.autoDispose<List<UserProfileModel>>(
  (ref) {
    final db = FirebaseFirestore.instance;
    return db.collection("users").orderBy("name").snapshots().map(
          // event는 아직 다큐먼트화되기 전의 데이타
          // .docs를 통해 다큐먼트리스트가 된다.
          (event) => event.docs
              // .map는 순환하면서 원소들을 doc라는 이름으로 제공한다.
              .map(
                (doc) => UserProfileModel.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  },
);
