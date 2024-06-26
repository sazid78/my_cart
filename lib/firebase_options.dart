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
    apiKey: 'AIzaSyDbc5u1mAbSI18jEV4ILkTkzf4sTnC6qIw',
    appId: '1:987138276774:web:343520da8282b832b8a367',
    messagingSenderId: '987138276774',
    projectId: 'my-cart-1eb98',
    authDomain: 'my-cart-1eb98.firebaseapp.com',
    storageBucket: 'my-cart-1eb98.appspot.com',
    measurementId: 'G-FKQV8FMB63',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2--j5KHHzueBI491e7OYqvoJh92ckFsY',
    appId: '1:987138276774:android:373dc8f2831d25b5b8a367',
    messagingSenderId: '987138276774',
    projectId: 'my-cart-1eb98',
    storageBucket: 'my-cart-1eb98.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCFbtKZcJlVI-0eUfJ2j6Ta-dD5kOvORk',
    appId: '1:987138276774:ios:2ddfe7308f0ed067b8a367',
    messagingSenderId: '987138276774',
    projectId: 'my-cart-1eb98',
    storageBucket: 'my-cart-1eb98.appspot.com',
    iosBundleId: 'com.example.myCart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCFbtKZcJlVI-0eUfJ2j6Ta-dD5kOvORk',
    appId: '1:987138276774:ios:2ddfe7308f0ed067b8a367',
    messagingSenderId: '987138276774',
    projectId: 'my-cart-1eb98',
    storageBucket: 'my-cart-1eb98.appspot.com',
    iosBundleId: 'com.example.myCart',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDbc5u1mAbSI18jEV4ILkTkzf4sTnC6qIw',
    appId: '1:987138276774:web:df96ccdc67d4c0fab8a367',
    messagingSenderId: '987138276774',
    projectId: 'my-cart-1eb98',
    authDomain: 'my-cart-1eb98.firebaseapp.com',
    storageBucket: 'my-cart-1eb98.appspot.com',
    measurementId: 'G-535V2QRN5F',
  );
}
