import 'package:flutter/material.dart';

class Snackbarpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
     
        child: Text("Click here"),
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text("Hello World"),
            action: SnackBarAction(
              onPressed: () {}, label: 'Undo',
              
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      )),
    );
  }
}
