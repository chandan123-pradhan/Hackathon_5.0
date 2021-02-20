import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:geolocator/geolocator.dart';
import 'package:medicalproject/views/homeScreen.dart';

String homeaddressLocation = 'Tap to add location';
String mockAllServices = 'Updated Services';



class AmbulanceBooking extends StatefulWidget {
  @override
  _AmbulanceBookingState createState() => _AmbulanceBookingState();
}

class _AmbulanceBookingState extends State<AmbulanceBooking> {

bool isProcessing=false;
    Response response;
  Position position;
  void initState() {
    super.initState();
 //   getCurrentLocation();
  }

  // Future getCurrentLocation() async {
  //   final currentPosition =
  //       await GeolocatorPlatform.instance.getCurrentPosition();
  //   setState(() {
  //     position = currentPosition;
  //   });

  //   final coOrdinates =
  //       geoCo.Coordinates(position.latitude, position.longitude);
  //   final address =
  //       await geoCo.Geocoder.local.findAddressesFromCoordinates(coOrdinates);
  //   final firstAddress = address.first;
  //   setState(() {
  //     homeaddressLocation = firstAddress.addressLine;
  //   });
  // print(firstAddress.addressLine);
  //  // return homeaddressLocation;
  // // final Map parsed = await json.decode(mockAllServices);
  
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

 

void getLocation()async{
  setState((){
    isProcessing=true;
  });
  await Timer(Duration(seconds:5),(){
     setState((){
    isProcessing=false;
  });
  notify("Ambulance booked. we'll help you as soon as posible please take care");
  Get.offAll(HomePage());
  
});
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Emergency Ambulance Services",style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold)),
      centerTitle: true,
      elevation: 0.0,
      ),

      body:ListView(
        children: [
          Container(
            height:Get.height/4,
            decoration: BoxDecoration(
              color:Colors.red,

            ),
            alignment: Alignment.center,
  child:Container(
    height:Get.height/5,
    width:Get.width/1.3,
    decoration: BoxDecoration(
      image:DecorationImage(
        image: AssetImage(
          "images/ambulance.png"
        ),
        fit:BoxFit.cover
      )
    ),
  )
          ),

SizedBox(height:20),


Padding(
  padding: const EdgeInsets.all(15),
  child:   InkWell(
    onTap:(){
      getLocation();
    },
      child: Container(
    
      height:50,
    
      decoration: BoxDecoration(
    
        color:Colors.red,
    
        borderRadius: BorderRadius.circular(20),
    
    
    
      ),
    
      alignment: Alignment.center,
      child:isProcessing?CircularProgressIndicator(
        backgroundColor: Colors.white,
      ):Text("Need Help",style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold))
    
    ),
  ),
)





        ],
      )


      
    );
  }
}