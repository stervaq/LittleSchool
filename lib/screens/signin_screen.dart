import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school/screens/home_screen.dart';

import '../reusable_widgets/reusable_widget.dart';
import 'signup_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/png-transparent-programmer-computer-programming-drawing-others-photography-computer-logo.png"),
               const SizedBox(
                  height: 85,
                ),
                reusableTextField("Email", Icons.verified_user, false, _emailTextController),
               const SizedBox(height: 30,),
                reusableTextField("Пароль", Icons.lock, false, _passwordTextController),
               const SizedBox(height: 20,),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()),);
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  })
                  ;
                  },
                 ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }


  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("У вас нет аккаунта?", style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen() ));
            } ,
          child: const Text(" Регистрация", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}

