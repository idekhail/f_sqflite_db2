import 'package:f_sqflite_db2/loginpage.dart';
import 'package:f_sqflite_db2/showpage.dart';
import 'package:f_sqflite_db2/sqldb.dart';
import 'package:flutter/material.dart';

import 'json/users.dart';

class UpdatePage extends StatelessWidget {
  final db = SqlDb();
  final userController = TextEditingController();
  final passController = TextEditingController();
  Users usr;
  @override
  UpdatePage({required this.usr});

  updateU() async{
      usr.username = userController.text.toString();
      usr.password = passController.text.toString();
     // print(this.usr.username);
      var response = await db.updateUser(usr);
      if(response > 0){
        print("Ok");
      }else{
        print("Error");
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: Container(
        color: const Color.fromARGB(100, 100, 109, 5),
        child: Column(
          children: <Widget>[

            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                '${usr.id}',
                style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.blue[900]!,
                ),
              ),
            ),

            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: userController,
                style: const TextStyle(fontSize: 22),
                decoration: InputDecoration(hintText: '${usr.username}'),
              ),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: passController,
                style: const TextStyle(fontSize: 22),
                decoration: InputDecoration(hintText: '${usr.password}'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              color: const Color.fromARGB(100, 100, 19, 5),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // use whichever suits your need
                children: [
                  //const Padding(padding: EdgeInsets.all(30)),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async {

                      updateU();
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () async {
                      await db.deleteUser(usr);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPage(usr: usr)));
                    },
                    child: const Text(
                      "Back",
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
