//Joel Bautista
//se importan otras hojas y librerias
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//se crea una clase  RegisterPage de tipo stateful
class RegisterPage extends StatefulWidget {

  //se trae la showLoginPage
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  //se crean los controladores con el tipo de datos que son
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userProfileController = TextEditingController();

  //se comienza a hacer el enlace con la base de datos de cuando se registra uno  con que campos se debe registrar y a donde los debe mandar
  Future signIn() async{
    if(passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //add user details
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _userProfileController.text.trim(),
        _emailController.text.trim()
      );
    }
  }
  //se le especifican los detalles del usuario y que tipo van hacer
  Future addUserDetails(
      String firstName,
      String lastName,
      String userProfile,
      String email
      )async{
    await FirebaseFirestore.instance.collection('cuentas').add({
      'first name': firstName,
      'last name': lastName,
      'user profile': userProfile,
      'email': email,
    });
  }
  //se hace una funcion de tipo boleana la cual tiene que ser la misma contraseña digitada
  bool passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }
  @override
  //se crea un metodo la cual Este ciclo de vida es el que necesita para cancelar la suscripción de secuencias, eliminar animaciones, etc.
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _userProfileController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //se retorna un scaffold la cual sirve para Es un widget que es usado para contener otros widgets.
    return Scaffold(
      backgroundColor: Colors.grey[300],
      //se crea un safearea hace que la interfaz de usuario sea dinámica y adaptable a una amplia variedad de dispositivos.
      body: SafeArea(
        //se crea un hijo la cual va a centrar los elementos
        child: Center(
          //se utiliza para darle scroll a la pantalla
          child: SingleChildScrollView(
            //se hace una columna  la cual van a ver varios elementos hay almacenados
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //se trae varios elementos  en la misma raiz con el children
              children: [
                const SizedBox(height: 10),
                Text(
                    'Hola Aprendiz',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 60,
                  )
                ),
                const SizedBox(height: 10),
                const Text(
                  'Registre sus datos a continuacion',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 40),
                //TextField Email
                Padding(padding:
                const EdgeInsets.symmetric(horizontal: 25.0),
                  //se crea un textfield junto con un controlador
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'First Name',
                      fillColor: Colors.grey[200],
                      filled: true
                    ),
                  )
                ),
                const SizedBox(height: 10),
                //Textfield password
                Padding(padding: 
                const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _lastNameController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:  Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Last Name',
                      fillColor: Colors.grey[200],
                      filled: true
                    ),
                  )
                ),
                const SizedBox(height: 10),
                Padding(padding:
                    const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                        controller: _userProfileController,
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
                      hintText: 'User Profile',
                      fillColor: Colors.grey[200],
                      filled: true
                      ),
                  )
                ),
                const SizedBox(height: 10),
                    //button inicio
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                //pasword TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:  const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true
                    ),
                    )
                ),
                const SizedBox(height: 10),
                //Confirm password TectField
                Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Confirm Password',
                    fillColor: Colors.grey[200],
                    filled:true
                  ),
                )
                ),
               const SizedBox(height: 20),
               //button Inicio
               Padding(padding: const EdgeInsets.symmetric(horizontal: 30.0),
               child: GestureDetector(
                 onTap: signIn,//metodo que gestiona la creacion de nuevas cuentas
                 child: Container(
                   padding: const EdgeInsets.all(15.0),
                   decoration: BoxDecoration(
                     color: Colors.deepPurple,
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: const Center(
                     child: Text(
                       'Registrarse Ahora',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                        '¡Soy miembro!',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        ) ,
                        ),
                    //se crea gesturedetector la cual  se utiliza para detectar la interacción física con la aplicación en la interfaz de usuario.
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text('Iniciar sesion',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ) ,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
