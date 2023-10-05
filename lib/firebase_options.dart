// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBIfx4ih6-A7EjN_2Zkbt1-VImXYXSbeBE',
    appId: '1:806695647689:web:e4825d8387841a065f1018',
    messagingSenderId: '806695647689',
    projectId: 'tik-tok-clone-choo',
    authDomain: 'tik-tok-clone-choo.firebaseapp.com',
    storageBucket: 'tik-tok-clone-choo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQrW4Udx8i9T7c-1HDvYyKngwZa5b5EZE',
    appId: '1:806695647689:android:ec084793d1465a105f1018',
    messagingSenderId: '806695647689',
    projectId: 'tik-tok-clone-choo',
    storageBucket: 'tik-tok-clone-choo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeQlEdevJozeAkCGnDHIixd0HfMvqjxCY',
    appId: '1:806695647689:ios:d6303f2217b0aaee5f1018',
    messagingSenderId: '806695647689',
    projectId: 'tik-tok-clone-choo',
    storageBucket: 'tik-tok-clone-choo.appspot.com',
    iosBundleId: 'com.example.tiktokClone',
  );
}
