//Joel Bautista
//se importan otras hojas y librerias
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/data/get_user_name.dart';

//se crea la clase homepage de tipo stateful
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;


  //lista de identificadores de documentos (ID Documents :: Firestore)
  List<String>docIds = [];


  //get docIds :: metodo para obtener la lista de identificadores de documentos
  Future getDocId()async{
    await FirebaseFirestore.instance.collection('cuentas').get().then((snapshot) => snapshot.docs.forEach((document) {
      print(document.reference);//imprime lista de documentos en la consola
      docIds.add(document.reference.id);
    })
    );
  }
  @override
  void initState(){
    getDocId();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    //se retorna un scaffold la cual sirve para Es un widget que es usado para contener otros widgets.
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Inicio Sesion ${user.email!}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.logout),
          )
        ],
      ),
      //se crea un cuerpo centrado
      body: Center(
        //se crea un hijo que va a tener una columna
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //se crea un expanded utilizar Rows y Columns para estructurar los elemento de nuestras pantallas en Flutter.
            Expanded(child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot){
                return ListView.builder(itemCount: docIds.length,
                  itemBuilder: (context, index){
                    return Padding(padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: GetUserName(documentId: docIds[index]),
                        tileColor: Colors.grey[200],
                      ),
                    );
                  },
                );
              },
            )
            )
          ],
        ),
      ),
    );
  }
}
