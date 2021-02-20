import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalproject/views/bloodDonationCamp.dart';
import 'package:medicalproject/views/drawerMenu.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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



  @override
  Widget build(BuildContext context) {

   final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();



    return Scaffold(
            key: _scaffoldKey,
      appBar: AppBar(
        
elevation:0.0,

        
        centerTitle: true,
        title:Text("Health Care "),



     leading: IconButton(
            icon: Icon(Icons.notes),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
         
        ),
     

   drawer: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
            child: Drawer(
              child: DrawerMenuItems()
              ),
          ),
        ),




    
      body:Container(
        child:CustomScrollView(
          slivers: [
             SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                                borderRadius: BorderRadius.circular(0),
                                image: DecorationImage(
                                    image: AssetImage(_images[index]),
                                    fit: BoxFit.fill)),
                          );
                        },
                      ),
                    )),
              ),
            ]),
          ),

SliverList(
delegate: SliverChildListDelegate(
  [
    Padding(
      padding: const EdgeInsets.fromLTRB(15,15,15,15),
      child: Text("Donations:",style:TextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold)),
    ),


Padding(
  padding: const EdgeInsets.fromLTRB(15,0,15,0),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.start,
  
    children: [
  
   
   InkWell(
     splashColor: Colors.blueGrey,
     onTap:(){
       Get.to(BloodDonationCampScreen());
     },
        child: Container(
  
          height:Get.height/7,
  
          width:Get.height/7,
  
          decoration:BoxDecoration(
  
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color:Colors.white,
       //     border:Border.all(width:1,color:Colors.red),
  
            borderRadius: BorderRadius.circular(10)
  
          ),

          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height:Get.height/16,
                child: Icon(Icons.location_on,size: 50,color:Colors.red)),
                Divider(height:0.5,color:Colors.black26),
              SizedBox(height:5),
            //  Divider(height:0.5,color:Colors.black26),
              Container(
                alignment: Alignment.center,
                child: Text("Blood Donation Camp",textAlign:TextAlign.center,style:TextStyle(color:Colors.black,fontSize:16,)))

            ],
          )
  
        ),
   ),
      SizedBox(width:10),
  
   Container(
  
        height:Get.height/7,
  
        width:Get.height/7,
  
        decoration:BoxDecoration(
  
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 3,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    color:Colors.white,
     //     border:Border.all(width:1,color:Colors.red),
  
          borderRadius: BorderRadius.circular(10)
  
        ),

        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height:Get.height/16,
              child: Icon(Icons.account_balance,size: 50,color:Colors.red)),
              Divider(height:0.5,color:Colors.black26),
            SizedBox(height:5),
            Container(
              alignment: Alignment.center,
              child: Text("Organ Donation Camp",textAlign:TextAlign.center,style:TextStyle(color:Colors.black,fontSize:16,)))

          ],
        )
  
      ),
  
    ],
  
  ),
),




 Padding(
      padding: const EdgeInsets.fromLTRB(15,30,15,15),
      child: Text("Services:",style:TextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold)),
    ),


Padding(
  padding: const EdgeInsets.fromLTRB(15,0,15,0),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    children: [
  
        Container(
  
        height:Get.height/7,
  
        width:Get.height/7,
  
        decoration:BoxDecoration(
  
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 3,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    color:Colors.white,
     //     border:Border.all(width:1,color:Colors.red),
  
          borderRadius: BorderRadius.circular(10)
  
        ),

        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height:Get.height/16,
              child: Icon(Icons.directions_car_outlined,size: 50,color:Colors.red)),
          //   Divider(height:0.5,color:Colors.black26),
            SizedBox(height:5),
            Divider(height:0.5,color:Colors.black26),
            Container(
              alignment: Alignment.center,
              child: Text("Emergency Ambulance Services",textAlign:TextAlign.center,style:TextStyle(color:Colors.black,fontSize:16,)))

          ],
        )
  
      ),
  
  
      Container(
  
        height:Get.height/7,
  
        width:Get.height/7,
  
        decoration:BoxDecoration(
  
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 3,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    color:Colors.white,
     //     border:Border.all(width:1,color:Colors.red),
  
          borderRadius: BorderRadius.circular(10)
  
        ),

        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height:Get.height/16,
              child: Icon(Icons.home,size: 50,color:Colors.red)),
               Divider(height:0.5,color:Colors.black26),
            SizedBox(height:5),
         //  Divider(height:0.5,color:Colors.black26),
            Container(
              alignment: Alignment.center,
              child: Text("Hospital Services",textAlign:TextAlign.center,style:TextStyle(color:Colors.black,fontSize:16,)))

          ],
        )
  
      ),
  
     Container(
  
        height:Get.height/7,
  
        width:Get.height/7,
  
        decoration:BoxDecoration(
  
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 3,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    color:Colors.white,
     //     border:Border.all(width:1,color:Colors.red),
  
          borderRadius: BorderRadius.circular(10)
  
        ),

        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height:Get.height/16,
              child: Icon(Icons.person,size: 50,color:Colors.red)),
               Divider(height:0.5,color:Colors.black26),
            SizedBox(height:5),
           
            Container(
              alignment: Alignment.center,
              child: Text("Doctor Appointment",textAlign:TextAlign.center,style:TextStyle(color:Colors.black,fontSize:16,)))

          ],
        )
  
      ),
  
    ],
  
  ),
),



 Padding(
      padding: const EdgeInsets.fromLTRB(15,30,15,15),
      child: Text("Do You Have Any Question:",style:TextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold)),
    ),


  Container(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15,0,15,15),
      child: Container(
      
            height:Get.height/7,
      
            width:Get.height/7,
      
            decoration:BoxDecoration(
      
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color:Colors.white,
         //     border:Border.all(width:1,color:Colors.red),
      
              borderRadius: BorderRadius.circular(10)
      
            ),

            child:Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height:Get.height/16,
                  child: Icon(Icons.group_work,size: 50,color:Colors.red)),
                   Divider(height:0.5,color:Colors.black26),
                SizedBox(height:5),
               
                Container(
                  alignment: Alignment.center,
                  child: Text("Community",textAlign:TextAlign.center,style:TextStyle(color:Colors.black,fontSize:16,)))

              ],
            )
      
          ),
    ),
  ),
  




  ]
),

)







          ],
        )
      )
    );
  }
}