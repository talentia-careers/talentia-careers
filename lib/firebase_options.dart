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
    apiKey: 'AIzaSyBRq9knjlMA5vsim_T2JCBaVlIUm9laO5U',
    appId: '1:952953741784:web:fd6a3eb7eeb0716e02d2ad',
    messagingSenderId: '952953741784',
    projectId: 'my-career-portal',
    authDomain: 'my-career-portal.firebaseapp.com',
    storageBucket: 'my-career-portal.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9AqmGoSlpH_6uQtbjRO_OTPS-dAfsD9k',
    appId: '1:952953741784:android:38d7d060d416fb4602d2ad',
    messagingSenderId: '952953741784',
    projectId: 'my-career-portal',
    storageBucket: 'my-career-portal.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCaukd2MJaphLorUdhprJPgZRZ0EIjzVA',
    appId: '1:952953741784:ios:1215eadec4bc152802d2ad',
    messagingSenderId: '952953741784',
    projectId: 'my-career-portal',
    storageBucket: 'my-career-portal.firebasestorage.app',
    iosBundleId: 'com.example.jobPortalApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCaukd2MJaphLorUdhprJPgZRZ0EIjzVA',
    appId: '1:952953741784:ios:1215eadec4bc152802d2ad',
    messagingSenderId: '952953741784',
    projectId: 'my-career-portal',
    storageBucket: 'my-career-portal.firebasestorage.app',
    iosBundleId: 'com.example.jobPortalApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBRq9knjlMA5vsim_T2JCBaVlIUm9laO5U',
    appId: '1:952953741784:web:be6bf05a9e5f34e402d2ad',
    messagingSenderId: '952953741784',
    projectId: 'my-career-portal',
    authDomain: 'my-career-portal.firebaseapp.com',
    storageBucket: 'my-career-portal.firebasestorage.app',
  );

}