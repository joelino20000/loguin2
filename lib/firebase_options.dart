// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
//Joel Bautista
//se importan otras hojas y librerias
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
//se crea una clase la cual me va a decir para que tipo de dispositivo se va a retornar la base de datos o si no por defecto va a mandar error
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
  //se crean los campos  para cada registros y entablar el enlace con la base de datos
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBA71RVqXKQRmN4BZ5eTmOCTDLOairZqKQ',
    appId: '1:248200005544:web:4b67ac669258110a953f9d',
    messagingSenderId: '248200005544',
    projectId: 'loginui-796a1',
    authDomain: 'loginui-796a1.firebaseapp.com',
    storageBucket: 'loginui-796a1.appspot.com',
    measurementId: 'G-Z9TWKTXNTL',
  );

  //se crean los campos  para cada registros y entablar el enlace con la base de datos
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjMIl868vQVLStOoAir_beHCXJfQBXF40',
    appId: '1:248200005544:android:b44861499c682170953f9d',
    messagingSenderId: '248200005544',
    projectId: 'loginui-796a1',
    storageBucket: 'loginui-796a1.appspot.com',
  );

  //se crean los campos  para cada registros y entablar el enlace con la base de datos
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDX-HpE0oMqnprwk3g80tYwaygBUwyqvwg',
    appId: '1:248200005544:ios:554c52769b59adfb953f9d',
    messagingSenderId: '248200005544',
    projectId: 'loginui-796a1',
    storageBucket: 'loginui-796a1.appspot.com',
    iosClientId: '248200005544-v4mclemu8j94870v21eer0c7n2bofttl.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginUi',
  );

  //se crean los campos  para cada registros y entablar el enlace con la base de datos
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDX-HpE0oMqnprwk3g80tYwaygBUwyqvwg',
    appId: '1:248200005544:ios:554c52769b59adfb953f9d',
    messagingSenderId: '248200005544',
    projectId: 'loginui-796a1',
    storageBucket: 'loginui-796a1.appspot.com',
    iosClientId: '248200005544-v4mclemu8j94870v21eer0c7n2bofttl.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginUi',
  );
}
