import 'package:f_sqflite_db2/loginpage.dart';
import 'package:f_sqflite_db2/sqldb.dart';
import 'package:f_sqflite_db2/updatepage.dart';
import 'package:flutter/material.dart';

import 'json/users.dart';

class ShowPage extends StatelessWidget {
  final db = SqlDb();
  final userController = TextEditingController();
  final passController = TextEditingController();
  Users usr;
  @override


  ShowPage({required this.usr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Page'),
      ),
      body: Container(
        color: const Color.fromARGB(100, 100, 109, 5),
        child: Column(
          children: [

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
              child: Text(
                '${usr.username}',
                style: TextStyle(
                  fontSize: 40,
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

              child: Text(
                '${usr.password}',
                style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.blue[900]!,
                ),
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>UpdatePage(usr: usr)));
                      },
                    child: const Text(
                      "Update Page",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: const Text(
                      "Logout",
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
