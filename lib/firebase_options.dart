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
    apiKey: 'AIzaSyB-iBUJtT7KHP5azvepcaP_zl6BJhhmpIM',
    appId: '1:282240770003:web:a47cf0a7e2450ba4b81926',
    messagingSenderId: '282240770003',
    projectId: 'flutter-assignment-0257',
    authDomain: 'flutter-assignment-0257.firebaseapp.com',
    storageBucket: 'flutter-assignment-0257.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQaC4UYGyUnJVIpEt8_SgK2dmGmdsbmFU',
    appId: '1:282240770003:android:3ec10f4125e36904b81926',
    messagingSenderId: '282240770003',
    projectId: 'flutter-assignment-0257',
    storageBucket: 'flutter-assignment-0257.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAipDUIN32q2Nsr1P3kQXpuIWhD_ThpZlk',
    appId: '1:282240770003:ios:e193b2f8a7942387b81926',
    messagingSenderId: '282240770003',
    projectId: 'flutter-assignment-0257',
    storageBucket: 'flutter-assignment-0257.appspot.com',
    iosClientId: '282240770003-1scov3065u7sd1kk6aeu9e59psijk4rm.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAipDUIN32q2Nsr1P3kQXpuIWhD_ThpZlk',
    appId: '1:282240770003:ios:e193b2f8a7942387b81926',
    messagingSenderId: '282240770003',
    projectId: 'flutter-assignment-0257',
    storageBucket: 'flutter-assignment-0257.appspot.com',
    iosClientId: '282240770003-1scov3065u7sd1kk6aeu9e59psijk4rm.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAssignment',
  );
}
