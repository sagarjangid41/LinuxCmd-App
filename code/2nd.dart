import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(cmd());
}

class cmd extends StatefulWidget {
  @override
  _cmdState createState() => _cmdState();
}

class _cmdState extends State<cmd> {
  var authc = FirebaseAuth.instance;
  var data = FirebaseFirestore.instance;

  String input1;
  var r;
  myweb(value) async {
    var url = await http.get("http://192.168.43.53/cgi-bin/ram.py?x=${value}");

    setState(() {
      r = url.body;
      //print(r);
    });
  }

  insert() async {
    await Future.delayed(Duration(seconds: 1));
    data.collection("cmd").add({"cmd": input1, "output": r});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.deepPurple.shade300,
          appBar: AppBar(
            shadowColor: Colors.red,
            backgroundColor: Colors.deepPurple.shade600,
            title: Text(
              "Linux CMD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          body: Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 12.5),
                          width: 300,
                          height: 70,
                          child: TextField(
                            onChanged: (value) {
                              input1 = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your command',
                            ),
                          ),
                        ),
                        //--------------------------------------------------------
                        Container(
                          //margin: EdgeInsets.only(top: 5.5),
                          width: 70,
                          height: 55,
                          child: RaisedButton(
                            onPressed: () {
                              myweb(input1);
                              insert();
                            },
                            color: Colors.deepPurple.shade600,
                            child: Icon(Icons.send),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, right: 20),
                    color: Colors.black,
                    // height: 500,
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    child: Container(
                      child: Text(
                        r ?? "output coming ..",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
