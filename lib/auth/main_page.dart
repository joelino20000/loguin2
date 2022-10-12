//Joel Bautista
//se importan otras hojas y librerias
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/auth/auth_page.dart';
import '../pages/home_page.dart';
import '../pages/Login_page.dart';

//se crea un mainpage de tipo stateful

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    //se retorna un scaffold la cual sirve para Es un widget que es usado para contener otros widgets
    return Scaffold(
        //se crea StreamBuilder nos permite hacer un rebuild del componente cuando ocurre un evento nuevo
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
            if(snapshot.hasData){
              return const HomePage();
            }else{
              return const AuthPage();
              }
        },
      ),
    );
  }
}
