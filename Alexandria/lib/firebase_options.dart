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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCXmB-KYAkWLz9ico1eLb5Xbznofpiggjc',
    appId: '1:457521390273:web:dcae647decf3487137aa40',
    messagingSenderId: '457521390273',
    projectId: 'alexandria-12',
    authDomain: 'alexandria-12.firebaseapp.com',
    storageBucket: 'alexandria-12.appspot.com',
    measurementId: 'G-SLWCV3Y704',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQPmVhfPtkqT1H-XEmlyOW7IucDGlUOag',
    appId: '1:457521390273:android:259e61fa92e3124e37aa40',
    messagingSenderId: '457521390273',
    projectId: 'alexandria-12',
    storageBucket: 'alexandria-12.appspot.com',
  );
}
