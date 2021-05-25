import 'package:flutter/material.dart';
import 'package:healthtracker/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  bool isLoading = false;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  loginApi(String email, String password) async {
    var uri = Uri.parse('https://83ef0fc67729.ngrok.io/login');
    var jsonData;

    Map<String, String> data = {'email': email, 'password': password};

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.get(uri, headers: data);

    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(jsonData['statusCode']);
      if (jsonData['statusCode'] == 200) {
        print(jsonData);
        setState(() {
          isLoading = false;
          sharedPreferences.setString("userData", jsonData['body'].toString());
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Home()),
              (Route<dynamic> route) => false);
        });
      } else {
        print("--- No se ha encontrado al usuario");
      }
    } else {
      print("--- No se ha podido realizar la consulta con el API");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Health Tracker",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (input) => !input.contains("@")
                                  ? "Ingresar una dirección de correo válida."
                                  : null,
                              decoration: new InputDecoration(
                                  hintText: "Email",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).accentColor)),
                                  prefixIcon: Icon(Icons.email,
                                      color: Theme.of(context).accentColor))),
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              validator: (input) => input.length < 8
                                  ? "La constraseña no puede ser menos a 8 dígitos."
                                  : null,
                              obscureText: hidePassword,
                              decoration: new InputDecoration(
                                  hintText: "Constraseña",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).accentColor)),
                                  prefixIcon: Icon(Icons.lock,
                                      color: Theme.of(context).accentColor),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2),
                                      icon: Icon(hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility)))),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                loginApi(emailController.text,
                                    passwordController.text);
                              },
                              child: Text("Login"),
                              style: ElevatedButton.styleFrom(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 100))),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              child: Text("Registrarse"),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 80)))
                        ],
                      ))),
            ])
          ],
        ),
      ),
    );
  }
}
