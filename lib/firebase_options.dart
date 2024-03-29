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
        return macos;
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
    apiKey: 'AIzaSyDOnB6nbygUeavG620-UHMDYHESmdr4BMc',
    appId: '1:977125535934:web:71a5ea9c8305f2426b2eef',
    messagingSenderId: '977125535934',
    projectId: 'quizapp-55460',
    authDomain: 'quizapp-55460.firebaseapp.com',
    storageBucket: 'quizapp-55460.appspot.com',
    measurementId: 'G-ZHM15EXM3X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ1n75AsYdCRG46KJfjSNVjsl2MYIYAXs',
    appId: '1:977125535934:android:b6682fa1125e55c66b2eef',
    messagingSenderId: '977125535934',
    projectId: 'quizapp-55460',
    storageBucket: 'quizapp-55460.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3-MKBbiIhTxBDYxJFk3RUeqd-IlNbgw4',
    appId: '1:977125535934:ios:75e79607d36a5fac6b2eef',
    messagingSenderId: '977125535934',
    projectId: 'quizapp-55460',
    storageBucket: 'quizapp-55460.appspot.com',
    iosBundleId: 'com.example.quizapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3-MKBbiIhTxBDYxJFk3RUeqd-IlNbgw4',
    appId: '1:977125535934:ios:75e79607d36a5fac6b2eef',
    messagingSenderId: '977125535934',
    projectId: 'quizapp-55460',
    storageBucket: 'quizapp-55460.appspot.com',
    iosBundleId: 'com.example.quizapp',
  );
}
