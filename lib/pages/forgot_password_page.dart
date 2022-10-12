//Joel Bautista
//se importan otras hojas y librerias
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//se crea una clase ForgotPasswordPage de tipo stateful
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

      //se crea una variable de tipo cotrolador
      final _emailController = TextEditingController();

  @override
  //se crea un metodo dispose para Este ciclo de vida es el que necesita para cancelar la suscripción de secuencias, eliminar animaciones, etc.
  void dispose(){
    //TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  //se hace el enlace con la base de datos que el email sea algo valido y que este registrado
  Future passwordReset() async{
    final cuentaEmail = _emailController.text.trim();
    try{
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: cuentaEmail);
      showDialog<void>(context: context, barrierDismissible: true,
      //false= user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext){
        //se retorna un alertdialog para lerta que son muy conocidas, puedes utilizarlas para dar un aviso al usuario,
        return AlertDialog(
          title: const Text('Recuperacion de Contraseña'),
          content: Text('Un email fue enviado a la cuenta $cuentaEmail'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: (){
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
        },
      );
    }

    on FirebaseException catch(e){
      print(e);
      showDialog<void>(context: context, barrierDismissible: true,
        //false= user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext){
        return AlertDialog(
          title: const Text('Firebase Error'),
          content: Text('email error: $e'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: (){
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //se retorna un Es un widget que es usado para contener otros widgets
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      //se crea un cuerpo de tipo columna
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //se crea un children ya que hay varios tipos en una capa
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Ingrese su email para el restablecimiento de contraseña',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          ),
          const SizedBox(height: 10),
          Padding(
              padding:const EdgeInsets.symmetric(horizontal: 25.0),
              //se crea un hijo textfield junto a un controlador
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                  fillColor: Colors.grey[200],
                  filled: true
                ),
              )
          ),
          const SizedBox(height: 10),
          //se crea un boton para enviar  a restablecer contraseña
          MaterialButton(onPressed: passwordReset,

            color: Colors.deepPurple[200],
            child: const Text(
              'Restablecer contraseña',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          )


        ],
      )
    );
  }
}
