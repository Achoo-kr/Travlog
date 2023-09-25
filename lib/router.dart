import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/widgets/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/username_screen.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/video_recording_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const VideoRecordingScreen(),
  ),
]);
