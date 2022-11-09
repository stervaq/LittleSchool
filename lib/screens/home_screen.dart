import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school/screens/signin_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Выход"),
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            print("Успешынй выход");
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()),);
          });

        },
      ),
    );
  }
}
