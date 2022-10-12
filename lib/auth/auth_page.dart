import 'package:flutter/material.dart';
import 'package:login_ui/pages/register_page.dart';
import '../pages/Login_page.dart';
import '../pages/register_page.dart';
//Joel Bautista
//se importan otras hojas y librerias
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //Iniciamos se muestra la pagina
  bool showLoginPage = true;

  //Metodo para alternar pantallas
  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showRegisterPage:  toggleScreens);
    }else{
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
