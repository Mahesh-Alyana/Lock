import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:register/profile_screen.dart';
import 'package:register/register_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xE00062FF),
      body: ListView(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome,',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.07,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.89,
                  height: height * 0.0729,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.0121),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 5)
                      ]),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_outline),
                      hintText: "abc@gmail.com",
                      labelText: 'Mail ID',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.036,
                          color: const Color(0xff909090)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.0121),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  width: width * 0.89,
                  height: height * 0.0729,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.0121),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 5)
                      ]),
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      hintText: "Password",
                      labelText: 'Password',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.036,
                          color: const Color(0xff909090)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.0121),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                            (route) => true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.06,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: height * 0.07,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                      onPressed: () async {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        Future signIn() async {
                          var result = await auth.signInWithEmailAndPassword(
                              email: email.text, password: password.text);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileScreen(uid: result.user!.uid)),
                              (route) => false);
                        }

                        signIn();
                      },
                      child: Center(
                        child: Text(
                          'Check',
                          style: TextStyle(
                              color: const Color(0xE00062FF),
                              fontSize: width * 0.04),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
