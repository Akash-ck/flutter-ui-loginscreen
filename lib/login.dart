import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authservice.dart';

import 'templatePage.dart';
import 'gridview.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final key = GlobalKey<FormState>();

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Center(
      child: Container(
        width: 300,
        height: 400,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 200,
            height: 50,
            child: TextFormField(
              controller: namecontroller,
              style: TextStyle(color: Colors.white, fontSize: 15),
              validator: (value) {
                if (value.isEmpty) {
                  return "Username Empty";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 250,
            height: 50,
            child: TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              validator: (v) {
                if (v.isEmpty) {
                  return "Password is Empty";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              height: 50,
              width: 180,
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text(
                  "GUEST  LOG IN",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton.icon(
                height: 50,
                color: Colors.lightBlueAccent,
                onPressed: () => googleSignin().whenComplete(() async {
                  var user = await FirebaseAuth.instance.currentUser;

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
                icon: Icon(Icons.mediation),
                label: Text(
                  "GOOGLE SIGN IN",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ]),
      ),
    )));
  }
}
