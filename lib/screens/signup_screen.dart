import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Регистрация", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
      ),
        body: Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
    color: Colors.lightBlueAccent),
          child: SingleChildScrollView(child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 185,
                ),
                reusableTextField("Имя пользователя", Icons.person_outline, false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Пароль", Icons.lock_outline, false, _passwordTextController),
                const SizedBox(height: 55,),
                signInSignUpButton(context, false, () {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
                 .then((value) {
                  print("Успешная регистрация");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()),);
                }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
              })
              ],
            ),
          ),),
    ),
    );
  }
}
