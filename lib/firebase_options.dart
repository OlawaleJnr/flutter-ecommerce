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
    apiKey: 'AIzaSyD2Cvrj9mlwjOJmnBdy-Y6QMQrZU1CRETk',
    appId: '1:985378959183:web:fa9118fffd7f90e0c95f3a',
    messagingSenderId: '985378959183',
    projectId: 'flutter-ecommerce-eab',
    authDomain: 'flutter-ecommerce-eab.firebaseapp.com',
    storageBucket: 'flutter-ecommerce-eab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRwmS7e5JIyUKrdDHk3Hhwo9VpZPyMUrw',
    appId: '1:985378959183:android:772f07d9f29fb673c95f3a',
    messagingSenderId: '985378959183',
    projectId: 'flutter-ecommerce-eab',
    storageBucket: 'flutter-ecommerce-eab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxSbuweruTtFZBux4Uximva09T9_u9jIU',
    appId: '1:985378959183:ios:b7b81d05d30614cec95f3a',
    messagingSenderId: '985378959183',
    projectId: 'flutter-ecommerce-eab',
    storageBucket: 'flutter-ecommerce-eab.appspot.com',
    iosClientId: '985378959183-iolfrr8jcc0jt5sd3saponp5efrkpak3.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}
