import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? emaildata;
  String? passworddata;

  void setFuncation() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("email", email.text);
    pref.setString("password", password.text);
  }

  void getFuncation() async {
    var pref = await SharedPreferences.getInstance();
    emaildata = pref.getString('email');
    passworddata = pref.getString('password');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("shared preferences practice"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: email,
            ),
            TextField(
              controller: password,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setFuncation();
                  log("email:${email.text}");
                  log("email:${password.text}");
                },
                child: const Text("Save")),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  getFuncation();
                  log('email:$emaildata');
                  log("password:$passworddata");
                  setState(() {});
                },
                child: const Text("See")),
            const SizedBox(
              height: 10,
            ),
            Text('Email:$emaildata'),
            Text('Password:$passworddata'),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
