import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register/login_screen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController rollNumber = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController aadharNumber = TextEditingController();

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
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.07,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          'Create your account',
                          style: TextStyle(
                            color: const Color(0x9CFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.04,
                          ),
                        ),
                      ],
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
                    controller: userName,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline_rounded),
                      hintText: "Username",
                      labelText: 'Username',
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
                    controller: rollNumber,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline_rounded),
                      labelText: "Roll number",
                      hintText: '20211AXXXX',
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
                    controller: mobileNumber,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.call_outlined),
                      hintText: "9876543210",
                      labelText: 'Mobile number',
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
                    controller: aadharNumber,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline_rounded),
                      hintText: "1234 5678 9876 5432",
                      labelText: 'Aadhar number',
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
                    height: height * 0.07,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                      onPressed: () async {
                        Future<void> addUser() async {
                          FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                          CollectionReference users =
                              FirebaseFirestore.instance.collection("users");
                          var response = await firebaseAuth
                              .createUserWithEmailAndPassword(
                                  email: email.text, password: password.text)
                              .then((value) {
                            return users.doc(value.user!.uid).set({
                              'email': email.text,
                              'password': password.text,
                              'userName': userName.text,
                              'rollNumber': rollNumber.text,
                              'mobileNumber': mobileNumber.text,
                              'aadharNumber': aadharNumber.text,
                            });
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        }

                        addUser();
                      },
                      child: Center(
                        child: Text(
                          'Register',
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
