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
    apiKey: 'AIzaSyALwebJa8zF3wsnFO6NJs5Vf0sAt6AxiyI',
    appId: '1:768881320767:web:18f419862e87c8ba44698a',
    messagingSenderId: '768881320767',
    projectId: 'note-app-1928',
    authDomain: 'note-app-1928.firebaseapp.com',
    storageBucket: 'note-app-1928.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgd8LJkq-e4IbaY_x9RccGIUIkdMAhSLs',
    appId: '1:768881320767:android:0befdc009b80b2c044698a',
    messagingSenderId: '768881320767',
    projectId: 'note-app-1928',
    storageBucket: 'note-app-1928.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIKzr6Feu01OXSagiCKBfwudZJBpmhTdI',
    appId: '1:768881320767:ios:c0eb4256da73cdbe44698a',
    messagingSenderId: '768881320767',
    projectId: 'note-app-1928',
    storageBucket: 'note-app-1928.appspot.com',
    iosClientId: '768881320767-1ojsghq0larhtsd18t1mihip3ec0612r.apps.googleusercontent.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIKzr6Feu01OXSagiCKBfwudZJBpmhTdI',
    appId: '1:768881320767:ios:c0eb4256da73cdbe44698a',
    messagingSenderId: '768881320767',
    projectId: 'note-app-1928',
    storageBucket: 'note-app-1928.appspot.com',
    iosClientId: '768881320767-1ojsghq0larhtsd18t1mihip3ec0612r.apps.googleusercontent.com',
    iosBundleId: 'com.example.noteApp',
  );
}
