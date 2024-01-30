import 'package:f_sqflite_db2/showpage.dart';
import 'package:f_sqflite_db2/sqldb.dart';
import 'package:flutter/material.dart';

import 'json/users.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState()=> _HomeState() ;
}

class _HomeState extends State<LoginPage>{
  final userController = TextEditingController();
  final passController = TextEditingController();
  bool isChecked = false;
  bool isLoginTrue = false;
  final db = SqlDb();

  create() async{
    var response = await db.createUser(Users(username: userController.text, password: passController.text));
    if(response > 0){
      if(!mounted) return;
      print("ok");
      const AlertDialog(title: Text("Ok"));
    }else{
      print("Error");
      const AlertDialog(title: Text("Error"));
    }
  }
  login() async{
    var user = await db.loginUser(Users(username: userController.text, password: passController.text));
    if(user != null){
      if(!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPage(usr: user)));
    }else{
      setState(() {
        isLoginTrue = true;
        const AlertDialog(title: Text("Error", style: TextStyle(backgroundColor: Colors.green),));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Login Page'),
      ),
      body: Container(
        color: const Color.fromARGB(100, 100, 109, 5),
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: userController,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: passController,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(hintText: 'Password'),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(15),
              color: const Color.fromARGB(100, 100, 19, 5),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // use whichever suits your need
                children: [
                  //const Padding(padding: EdgeInsets.all(30)),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async{
                      create();
                    },
                    child: const Text("Insert Data",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  // Spacer(flex: 1),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.black38,
                    textColor: Colors.white,
                    onPressed: () async{
                      login();
                    },
                    child: const Text("Login User",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}