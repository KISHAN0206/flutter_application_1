// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import 'utils/routes.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  

  final _formkey = GlobalKey<FormState>();

  //You need to give that key into form widget

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
       await Future.delayed(Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    await Navigator.pushNamed(context, MyRoutes.con_route);
    setState(() {
      changeButton = false;
    });
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 85, horizontal: 10),
                child: Image(
                  
                  image: AssetImage("assets/13.jpeg"),
                ),
              ),
              Text("Welcome $name",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can't be Empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Enter Password"),
                      ),
                      obscureText: true,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Password can't be Empty";
                        } else if (value.length < 6) {
                          return "Password shoud be greater than six character";
                        }
                        return null;
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                  child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
