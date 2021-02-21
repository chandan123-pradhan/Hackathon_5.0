import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:medicalproject/views/homeScreen.dart';
import 'package:medicalproject/views/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
    


void checkAndForwordToTheNextScreen()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();

String email=await prefs.getString('userEmail');




  await Timer(Duration(seconds:2),(){

if(email.isEmpty){
Get.offAll(LoginScreen());
}
else
Get.offAll(HomePage());

   

});
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAndForwordToTheNextScreen();
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.local_hospital,size:80,color:Colors.white
            ),
          ),
          SizedBox(height:30),
          Container(
                alignment: Alignment.center,
        
            child: Text("All About Your Health Care.",textAlign:TextAlign.center,style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold)))
        ]
      ),
    );
  }
}