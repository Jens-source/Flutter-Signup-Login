import 'package:flutter/material.dart';
import 'services/userManagement.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  String _name;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white24,
            leading: new IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black,),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/welcomepage');
                }
            )
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: Text('Create an account',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(
                    children: <Widget>[
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          }
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          }
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'NAME',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          onChanged: (value) {
                            setState(() {
                              _name = value;
                            });
                          }
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        width: 270,
                        height: 40,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Color.fromRGBO(81, 113, 100, 0.8),
                        ),
                        child: OutlineButton(
                          child: Center(
                              child: Text('Signup',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  )
                              )
                          ),
                          onPressed: () {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: _email, password: _password)
                                  .then((signedInUser) {
                                Navigator.of(context).pushReplacementNamed(
                                    '/selectpic');
                                FirebaseAuth.instance.currentUser().then((val) {
                                  UserUpdateInfo updateUser = UserUpdateInfo();
                                  updateUser.photoUrl =
                                  'https://i.stack.imgur.com/34AD2.jpg';
                                  val.updateProfile(updateUser)
                                      .then((user) {
                                    FirebaseAuth.instance
                                        .currentUser()
                                        .then((user) {
                                      UserManagement()
                                          .storeNewUser(user, context);
                                      UserManagement.updateFirstName(_name);
                                    }).catchError((e) {
                                      print(e);
                                    });
                                  }).catchError((e) {
                                    print(e);
                                  });
                                }).catchError((e) {
                                  print(e);
                                });
                              });
                            },
                        ),
                      ),
                    ]
                )
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                child: Center(
                    child: Stack(
                      children: <Widget>[

                        Container(
                          child: Text('___________',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold,
                                  color: Colors.black38)),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 105, top: 10),
                          child: Text('or continue with',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black38)),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 220),
                          child: Text('__________',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold,
                                  color: Colors.black38)),
                        ),

                        Container(
                            padding: EdgeInsets.only(top: 70),
                            child: Container(
                                width: 130,
                                height: 40,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Color.fromRGBO(81, 113, 100, 0.2),
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(top: 7, bottom: 7),
                                  child: new Image.asset(
                                    'lib/assets/googleIcon.png',),
                                )
                            )
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 70, left: 170),
                            child: Container(
                                width: 130,
                                height: 40,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Color.fromRGBO(81, 113, 100, 0.2),
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: new Image.asset(
                                    'lib/assets/facebookIcon.png',),
                                )
                            )
                        ),
                      ],
                    )
                )
            )
          ],
        )
    );
  }
}