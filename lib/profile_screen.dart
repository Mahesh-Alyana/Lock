import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final userRef = FirebaseFirestore.instance.collection('users');
String name = '   ';
String rollNumber = '';
String mobileNumber = '';
String aadharNumber = '';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.uid}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var uid;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  getUser() {
    userRef.doc(widget.uid).get().then((value) => {
          setState(() {
            name = value.data()!['userName'];
            rollNumber = value.data()!['rollNumber'];
            aadharNumber = value.data()!['aadharNumber'];
            mobileNumber = value.data()!['mobileNumber'];
          })
        });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xE00062FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height * 0.15,
              width: height * 0.15,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors
                    .primaries[Random().nextInt(Colors.primaries.length)]
                    .withOpacity(0.5),
              ),
              child: Center(
                // ignore: unnecessary_string_interpolations
                child: Text(
                  "${name.substring(0, 1)}",
                  style: TextStyle(
                      fontSize: width * 0.07, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height * 0.6,
            width: width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: $name',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Roll Number: $rollNumber',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Mobile Number: $mobileNumber',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Aadhar Number: $aadharNumber',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
