import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class GetProduct extends StatelessWidget {
 final String documentId;

 GetProduct({required this.documentId});


  @override
  Widget build(BuildContext context) {
  //Получаем коллекции
  CollectionReference product = FirebaseFirestore.instance.collection('product');

    return FutureBuilder<DocumentSnapshot>(
      future: product.doc(documentId).get(),
        builder: ((context,snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic>  data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['name']}');
      }
      return Text('Загруза...');
    }),
    );
  }
}
