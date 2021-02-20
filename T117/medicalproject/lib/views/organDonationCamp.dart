import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medicalproject/views/homeScreen.dart';



class OrganDonationCampScreen extends StatefulWidget {
  @override
  _OrganDonationCampScreenState createState() => _OrganDonationCampScreenState();
}

class _OrganDonationCampScreenState extends State<OrganDonationCampScreen> {

List<String> _images=[
"images/slider19.jpg",
"images/slider16.jpg",
"images/slider14.jpeg",
"images/slider7.jpg",
"images/slider17.jpg",
"images/slider10.jpg",
"images/slider18.jpg",
"images/slider3.jpg"


 ];

bool isProcessing=false;
TextEditingController name=new TextEditingController();
TextEditingController address=new TextEditingController();


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

 

void request()async{
 
    setState((){
    isProcessing=true;
  });
  await Timer(Duration(seconds:5),(){
     setState((){
    isProcessing=false;
  });
  notify("your organ donation request is requested.");
  Get.offAll(HomePage());
  
});
 
}



  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      appBar: AppBar(
        title: Text("Organ Donation",style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold)),
      centerTitle: true,
      elevation: 0.0,
      ),


  body:ListView(
    children: [
      Container(
        height:Get.height/3,
        decoration: BoxDecoration(
          color:Colors.red,
          borderRadius:BorderRadius.only(
            bottomLeft:Radius.circular(20),
            bottomRight:Radius.circular(20),
          )
        ),
        child:Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Container(
               

                      
                    width: MediaQuery.of(context).size.width / 1,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          aspectRatio: 1.0,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                        ),
                        itemCount: _images.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight:Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(_images[index]),
                                    fit: BoxFit.fill)),
                          );
                        },
                      ),
                    )),
              ),
        
      ),

Padding(
  padding: const EdgeInsets.all(15),
  child:   Text("Request for Organ Donation",style:TextStyle(fontSize: 15,fontWeight:FontWeight.bold,color:Colors.black)),
),



   Padding(
                padding: const EdgeInsets.only(left: 15, right: 0, top: 10),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 0,bottom:20),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    alignment: Alignment.bottomLeft,
                    child: TextFormField(
                        //enabled: !isLogin,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: name,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "name is require";
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




    Padding(
                padding: const EdgeInsets.only(left: 15, right: 0, top: 10),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" Address",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 0,bottom:20),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    alignment: Alignment.bottomLeft,
                    child: TextFormField(
                      maxLines: 5,
                        //enabled: !isLogin,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: address,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "name is require";
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
          

SizedBox(height:20),


Padding(
  padding: const EdgeInsets.all(15),
  child:   InkWell(
    onTap:(){
      request();
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
      ):Text("Request",style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold))
    
    ),
  ),

)],
  )


    );
 
  }
}