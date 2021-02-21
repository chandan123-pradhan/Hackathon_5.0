import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';





class HospitalDetails extends StatefulWidget {
  String title;
  String image;
  String url;
  String description;
  HospitalDetails({this.title,this.image,this.url,this.description});
  @override
  _HospitalDetailsState createState() => _HospitalDetailsState(title,image,url,description);
}

class _HospitalDetailsState extends State<HospitalDetails> {
 String title;
  String image;
  String url;
String description;
  _HospitalDetailsState(this.title,this.image,this.url,this.description);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(title,style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold))
      ),

body:ListView(
  children: [
    Container(
      height:Get.height/3,
      decoration: BoxDecoration(image: DecorationImage(
        image: AssetImage(image),
        fit:BoxFit.cover
      ),
      
      ),
    ),
 //   SizedBox(height:30),


    Padding(
      padding: const EdgeInsets.all(15),
      child: Text("Descriptions:",style:TextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold)),
    ),


    Padding(
      padding: const EdgeInsets.all(15),
      child: Text(description,style:TextStyle(color:Colors.black,fontSize:16,)),
    ),



  ],
)
,


bottomNavigationBar: BottomAppBar(
  child:Container(
    height:80,
    child:Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:10),
          child: Container(
            height:50,
            width:Get.width/3,
            decoration: BoxDecoration(
              border:Border.all(width:1,color:Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment:Alignment.center,
            child:Text("Visit",style:TextStyle(color:Colors.red,fontSize:15,fontWeight:FontWeight.bold)),
          ),
        ),

        Padding(
            padding: const EdgeInsets.only(right:10),
       
          child: InkWell(
            onTap: ()async{
              await launch(url);
            },
                      child: Container(
              height:50,
              width:Get.width/3,
              decoration: BoxDecoration(
                color:Colors.red,
              //  border:Border.all(width:1,color:Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment:Alignment.center,
              child:Text("Book Appointment",style:TextStyle(color:Colors.white,fontSize:15,fontWeight:FontWeight.bold)),
            ),
          ),
        )
      ],
    )
  )
),

    );
  }
}