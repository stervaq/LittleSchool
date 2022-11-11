import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school/screens/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school/read_data/get_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//Список идентификаторов
List<String> productIDs = [];

//Получаем список
Future getProductID() async {
  await FirebaseFirestore.instance.collection('product').get().then(
        (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference);
          productIDs.add(document.reference.id);
        }),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlueAccent,
        //elevation: 0,
        title: const Text("Курсы", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
              });
            },
        child: const Icon(Icons.login_outlined),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.lightBlueAccent),
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: FutureBuilder(
              future: getProductID(),
              builder: (context,snapshot){
              return ListView.builder(
                itemCount: productIDs.length,
                itemBuilder: (context,index) {
                  return ListTile(title: GetProduct(documentId: productIDs[index]),
                  );
                },
              );
            },),
            ),
          ],
        ),
      ),
    );
  }
}

