// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...

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
        return windows;
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
    apiKey: 'AIzaSyBmXJolfbuIau0CcJJYd51pMgw8dfNtUps',
    appId: '1:923426620721:web:1b41601b5d85e7960edc10',
    messagingSenderId: '923426620721',
    projectId: 'dedguia',
    authDomain: 'dedguia.firebaseapp.com',
    storageBucket: 'dedguia.appspot.com',
    measurementId: 'G-5JK0506XNY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDerPLL7AwvDaSv8mB2pwDhU9jsFrXDMuk',
    appId: '1:923426620721:android:2ed8f60689feabb50edc10',
    messagingSenderId: '923426620721',
    projectId: 'dedguia',
    storageBucket: 'dedguia.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5LylTID4KcCiKO5Eee5zj7X76SQRvq3E',
    appId: '1:923426620721:ios:c791d001def7a0d00edc10',
    messagingSenderId: '923426620721',
    projectId: 'dedguia',
    storageBucket: 'dedguia.appspot.com',
    iosBundleId: 'com.example.ddguia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5LylTID4KcCiKO5Eee5zj7X76SQRvq3E',
    appId: '1:923426620721:ios:c791d001def7a0d00edc10',
    messagingSenderId: '923426620721',
    projectId: 'dedguia',
    storageBucket: 'dedguia.appspot.com',
    iosBundleId: 'com.example.ddguia',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBmXJolfbuIau0CcJJYd51pMgw8dfNtUps',
    appId: '1:923426620721:web:f1cbe4929e3a6c710edc10',
    messagingSenderId: '923426620721',
    projectId: 'dedguia',
    authDomain: 'dedguia.firebaseapp.com',
    storageBucket: 'dedguia.appspot.com',
    measurementId: 'G-7YGJHJ0Z3B',
  );
}
