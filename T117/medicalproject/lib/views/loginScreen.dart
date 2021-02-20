import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:medicalproject/views/SignUpScreen.dart';
import 'package:medicalproject/views/homeScreen.dart';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  

    bool _showPasswordVisible = false;

  TextEditingController emailControler = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();





  var _formKey = GlobalKey<FormState>();
  bool enable = false;
  bool isLogin = false;
  bool isError = false;


void login()async{
  if(_formKey.currentState.validate()){

         SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', emailControler.text.toString());


Get.offAll(HomePage());


    notify("Login Successfully completed");
  }
  else
  print("Sorry fill all field");
  
}

  void notify(String msg){
    Fluttertoast.showToast(
      
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.white,
        centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.orange),
      //     onPressed: () {
      //  //     Get.off(HomeScreen());
      //     },
      //   ),
        title: Text("Login",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text("Log In",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    alignment: Alignment.bottomLeft,
                    child: TextFormField(
                        enabled: !isLogin,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: emailControler,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "please enter your email";
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.grey[200], width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.grey[200], width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.yellow, width: 1),
                                borderRadius: BorderRadius.circular(10))))),
              ),
              // for password filedd

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        enabled: !isLogin,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: passwordController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "please enter your password";
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.grey[200], width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.grey[200], width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.yellow, width: 1),
                                borderRadius: BorderRadius.circular(10))))),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                 //     Get.to(ForgetPasswordScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Forgot Password? ",
                          style: TextStyle(
                              color: isLogin ? Colors.black54 : Colors.red,
                              fontWeight: FontWeight.w300)),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),

              Visibility(
                visible: isError,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Email and Password do not matched",
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Colors.red,
                          fontWeight: FontWeight.w300)),
                ),
              ),

// for login bottom

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: isLogin
                      ? () {}
                      : () {
                          login();
                        },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: isLogin ? Colors.black12 : Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(isLogin ? "Please wait..." : "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                ),
              ),

              SizedBox(height: 10),

              Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w300)),
                      InkWell(
                        onTap: isLogin
                            ? () {}
                            : () {
                                Get.to(SignUpScreen());
                              },
                        child: Text("  Register",
                            style: TextStyle(
                              color: isLogin ? Colors.black54 : Colors.red,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              if(Get.arguments!=null)Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Divider(height:3,color:Colors.blueGrey),
                    Text("Or",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:15,
                    )),
                    Divider(height:3,color:Colors.blueGrey),
                  ]
              ),
              SizedBox(height: 10),
              if(Get.arguments!=null)Center(
                child: InkWell(
                  onTap:(){
              //      Get.off(GuestCheckout());
                },
                  child: Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text("GUEST CHECKOUT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),

        )),
      ),
    );}
}