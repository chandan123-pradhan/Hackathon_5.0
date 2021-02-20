import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medicalproject/views/homeScreen.dart';
import 'package:medicalproject/views/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {



  bool _showPasswordVisible = false;
  TextEditingController fName=new TextEditingController();
  TextEditingController lName=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController emailControler = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();





  var _formKey = GlobalKey<FormState>();
  bool enable = false;
  bool isLogin = false;
  bool isError = false;

  File _image;
//String dateTime;
//DateTime currentDate=DateTime.now();
  final picker = ImagePicker();

 
// Future<void>_selectDate(BuildContext context )async{
 

// }







  Future getAddharCard() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera,
    
    imageQuality: 5,
    );

    setState(() {
      _image = File(pickedFile.path);
    
//imageChoosed=true;
    });
  }







void register()async{
  if(_formKey.currentState.validate() && _image!=null){

         SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', emailControler.text.toString());


  


    notify("Registration Successfully completed");
    Get.offAll(HomePage());
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
        title: Text("Register",
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
                child: Text("Sign Up",
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
                        enabled: !isLogin,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: fName,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "please enter your Firstname";
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
                SizedBox(height: 10),
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
                        enabled: !isLogin,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: lName,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "please enter your Last Name";
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

                SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" Address",
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
                        controller: address,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "please enter your Address";
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



              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" Scan Your Adhar Card",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: InkWell(
                  onTap: (){
                    getAddharCard();
                  },
                                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Text("Click here ",style:TextStyle(color:Colors.black,fontSize:16,)),
                      )),
                ),
              ),
        

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap:  () {
                          register();
                        },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: isLogin ? Colors.black12 : Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(isLogin ? "Please wait..." : "Register",
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
                      Text("Allready have an account ?",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w300)),
                      InkWell(
                        onTap: isLogin
                            ? () {}
                            : () {
                               Get.to(LoginScreen());
                              },
                        child: Text("  Login",
                            style: TextStyle(
                              color: isLogin ? Colors.black54 : Colors.red,
                              fontWeight: FontWeight.bold,
                            )),
                      ),

                    ],
                  )),
                    SizedBox(height: 30),
            ],
          ),

        )),
      ),
    );}
}