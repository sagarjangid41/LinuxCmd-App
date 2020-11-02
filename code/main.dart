import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linux/2nd.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: login1(),
    debugShowCheckedModeBanner: false,
  ));
}

class login1 extends StatelessWidget {
  @override
  var email;
  var pass;
  Widget build(BuildContext context) {
    var authc = FirebaseAuth.instance;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: Colors.blue.shade100,
            image: DecorationImage(
              image: AssetImage("images/bg1.jpg"),
              fit: BoxFit.cover,
            )),
        height: double.infinity,
        width: double.infinity,
        child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Text(
                "LINUX \ncommand prompt",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (cmd())),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                      child: Text(
                        "         Start   -->       ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      color: Colors.brown.shade200,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
