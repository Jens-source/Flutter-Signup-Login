import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signupPage.dart';
import 'services/signInManagement.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;


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
                      child: Text('Log In',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),

                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 25.0, left: 20.0),
                        child: InkWell(
                            child: Center(
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Color.fromRGBO(81, 113, 100, 0.6),
                          elevation: 0,
                          child: OutlineButton(
                            child: Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            onPressed: () {
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: _email,
                                  password: _password
                              )
                                  .then((FirebaseAuth) {
                                Navigator.of(context).pushReplacementNamed(
                                    '/homepage');
                              })
                                  .catchError((e) {
                                print(e);
                              });
                            },
                          ),
                        ),
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
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38)),
                                  ),

                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 105, top: 10),
                                    child: Text('or continue with',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black38)),
                                  ),

                                  Container(
                                    padding: EdgeInsets.only(left: 220),
                                    child: Text('__________',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38)),
                                  ),

                                  Container(
                                      padding: EdgeInsets.only(top: 70),
                                      child: Container(
                                          width: 130,
                                          height: 40,
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                7.0),
                                            color: Color.fromRGBO(
                                                81, 113, 100, 0.2),
                                          ),
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 7, bottom: 7),
                                              child: OutlineButton(
                                                borderSide: BorderSide.none,
                                                child: Center(
                                                  child: new Image.asset(
                                                    'lib/assets/googleIcon.png',),
                                                ),
                                                onPressed: () {
                                                  SignIn.signInWithGoogle(context);
                                                },
                                              )

                                          )
                                      )
                                  ),

                                  Container(
                                      padding: EdgeInsets.only(
                                          top: 70, left: 170),
                                      child: Container(
                                          width: 130,
                                          height: 40,
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                7.0),
                                            color: Color.fromRGBO(
                                                81, 113, 100, 0.2),
                                          ),
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 5),

                                              child: OutlineButton(
                                                borderSide: BorderSide.none,
                                                child: Center(
                                                  child: new Image.asset(
                                                    'lib/assets/facebookIcon.png',),
                                                ),
                                                onPressed: () {
                                                    
                                                },
                                              )

                                          )
                                      )
                                  ),
                                ],
                              )
                          )
                      )
                    ]
                )

            )
          ],
        ));
  }
}

