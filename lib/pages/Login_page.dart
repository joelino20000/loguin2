//Joel Bautista
//se importan otras hojas y librerias
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'forgot_password_page.dart';

//se crea una clase loginpage que sera de tipo statefuñ
class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;//archivo que no devulve valores
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controllers
  //se crean controladores con variables
  final _emailController= TextEditingController();
  final _passwordController = TextEditingController();

  //se crea la conexion con la base de datos de iniciar la sesion
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim(),);
  }
  //se usa un metodo dispose para Este ciclo de vida es el que necesita para cancelar la suscripción de secuencias, eliminar animaciones,
  @override
  void dispose(){
    //TODO :implement dispose
    super.dispose();
  }
  Widget build(BuildContext context) {
    //vamos a retornar un scaffold la cual nos sirve para Es un widget que es usado para contener otros widgets
    return Scaffold(
      //se crea un cuerpo junto un container la cual nos sirve para proporciona una manera conveniente de crer un widget con propiedades específicas
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('images/img1.png'),
                fit: BoxFit.cover,
              ),
            ),
          //se crea una carta la cual va a tener contenida todo_un login
          child: Card(
            //se centra la carta
              child: Center(
                //se le pone scroll a la carta
                child:SingleChildScrollView(
                  //se crea un hijo junto a una columna
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                        const Icon(
                          Icons.adb,
                          size: 100,
                        ),
                        const SizedBox(height: 75),
                        Text('¡Hola Aprendiz!',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 24,
                        )
                        ),
                        const SizedBox(height:  10),
                        const Text(
                          'Bienvenido de nuevo lo hemos Extrañado',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(padding:
                        const EdgeInsets.symmetric(horizontal: 25.0),
                          //se crea un texfield con un controlador
                          child: TextField(
                              controller: _emailController,
                              obscureText: false,
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
                                ),
                              ),
                        Padding(padding:
                        const EdgeInsets.symmetric(horizontal: 25.0),
                            //se crea un texfield con un controlador
                          child: TextField(
                              controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Password',
                              fillColor: Colors.grey[200],
                              filled: true
                            ),
                              )
                            ),
                        const SizedBox(height: 10),
                        Padding(padding:
                            const EdgeInsets.symmetric(horizontal: 25.0),
                          //se crea un hijo que va a contener una columna y un gestor de movimientos para enlazar diferentes paginas
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder:(context){
                                        return ForgotPasswordPage();
                                      }
                                      ),
                                  );
                                },
                                //se crea un hijo con un texto
                                child: const Text('¿Olvido su Contraseña?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                                )
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        //Button Inicio
                        Padding(padding:
                        const EdgeInsets.symmetric(horizontal: 30.0),
                          //se crea un gesturedetector para se utiliza para detectar la interacción física con la aplicación en la interfaz de usuario.
                          child: GestureDetector(
                            onTap: signIn,
                            //se crea un hijo con un container la cual nos sirve para proporciona una manera conveniente de crer un widget con propiedades específicas:
                            child: Container(
                              padding:const  EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //se crea un hijo la cual nos va a centrar el container  y texto
                              child: const Center(
                                child: Text(
                                  'Iniciar Sesion',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        //se crea una fila que va a tener varios campos como el de no tienes cuenta y registrate ahora
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  <Widget>[
                            const Text(
                              '¿No tiene cuenta?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: widget.showRegisterPage,
                              child: const Text('Registrese ahora!',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                              )
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
          ),
        )
    );
  }
}
