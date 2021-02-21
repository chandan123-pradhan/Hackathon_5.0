import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medicalproject/views/API.dart';
import 'package:medicalproject/views/homeScreen.dart';
import 'package:medicalproject/views/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {





  TextEditingController fNameController = new TextEditingController();
  TextEditingController lNameController = new TextEditingController();
  TextEditingController emailControler = new TextEditingController();
  TextEditingController mobileNumberController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPsswordController = new TextEditingController();
  String passwordForCheck;

  bool enable = false;


  void signUp() async {
    if (_formKey.currentState.validate()) {
      print("all right");
      setState(() {
        enable = true;
      });

      var responce = await Api().registerUser(
        fNameController.text,
        lNameController.text,
        emailControler.text,
        mobileNumberController.text,
        passwordController.text,
        confirmPsswordController.text,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (responce != null) {
        print("done");
        print(responce);

        await prefs.setInt('loggedin', 1);

        await prefs.setInt('customerId', responce['customer_id']);

        await prefs.setString('customerGroupId', responce['customer_group_id']);

//await prefs.setString('storeId',responce['store_id'] );

        await prefs.setString('firstName', responce['firstname']);

        await prefs.setString('lastName', responce['lastname']);

        await prefs.setString('userEmail', responce['email']);

        await prefs.setString('mobileNumber', responce['telephone']);

        await prefs.setInt('cartItem', 0);

        await prefs.setString('wishListItem', "0");
        print("done");

         notify("Registration Successfully completed");
    Get.offAll(HomePage());
      } else {
           notify("This email is already used");
      }

      setState(() {
        enable = false;
      });
    }
  }

  var _formKey = GlobalKey<FormState>();


  //var _formKey = GlobalKey<FormState>();
 // bool enable = false;
  bool isLogin = false;
  bool isError = false;

  //File _image;
//String dateTime;
//DateTime currentDate=DateTime.now();
 // final picker = ImagePicker();

 
// Future<void>_selectDate(BuildContext context )async{
 

// }







 







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
      backgroundColor: Colors.white,
      appBar: AppBar(
     
        centerTitle: true,
        title: Text("Register",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text("Hello",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
               
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(" First Name",
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
                          enabled: !enable,
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: fNameController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Firstname is require";
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
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(" Last Name",
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
                          enabled: !enable,
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: lNameController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Lastname is require";
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
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(" Email*",
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
                          enabled: !enable,
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: emailControler,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Email is require";
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
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(" Mobile Number",
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
                          enabled: !enable,
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: mobileNumberController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Mobile number is require";
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
                SizedBox(height: 20),
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
                      alignment: Alignment.bottomLeft,
                      child: TextFormField(
                          enabled: !enable,
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: passwordController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Password is require";
                            } else if (value.length < 6) {
                              return "password should be more than 6 character";
                            } else {
                              setState(() {
                                passwordForCheck = value;
                              });
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
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(" Confirm Password",
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
                          enabled: !enable,
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: confirmPsswordController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Confirm is require";
                            } else if (value != passwordForCheck) {
                              return "password and confirm password are not matched";
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
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                    signUp();
                    },
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: enable ? Colors.grey : Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(enable ? "Please wait..." : "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ?",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300)),
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child: Text("  Login",
                              style: TextStyle(
                                color: enable ? Colors.grey : Colors.red,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
}
}