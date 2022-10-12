//Joel Bautista
//se importan otras hojas y librerias
import 'package:flutter/material.dart';
import 'package:login_ui/pages/Login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth/main_page.dart';
//se da inicio a la aplicacion junto con la conesxion de la base de datos
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//se crea una clase myapp de tipo stateles
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //se retorna un material la cual sirve para MaterialApp es un widget que nos proporciona un layout orientado a Material Design.
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

