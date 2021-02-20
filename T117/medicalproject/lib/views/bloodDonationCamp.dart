import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BloodDonationCampScreen extends StatefulWidget {
  @override
  _BloodDonationCampScreenState createState() => _BloodDonationCampScreenState();
}

class _BloodDonationCampScreenState extends State<BloodDonationCampScreen> {
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



List<String>campName=[
"IRCS NHQ BLOOD Center",
"2002021 Red Van Moring",
"AJITSINGHBHAI G LAKOD",
"Blood Donation Camp Shivray"
];


List<String>campAddress=[
"Greater noida sector-63",
"20022021 Red Van Moring,Bapunagar, Ahmedabad",
"AJITSINGHBHAI LAKOD KHODIYAR MATANA MANDIR, ALIPUR,BODEL, CHHOTAUDEPUR, chhotaudepur",
"Grampanchayat office, mirzapur,"
];
List<String>phoneNumber=[
  "6200334143",
  "9065974832",
  "9931840930",
  "6201296276"
];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Donation",style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold)),
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
  child:   Text("Nearest Bool Donation Camp:",style:TextStyle(fontSize: 15,fontWeight:FontWeight.bold,color:Colors.black)),
),




Padding(
  padding: const EdgeInsets.all(15),
  child:   Column(
  
    children: [
  
   for (int i = 0; i < campName.length; i++)
  
                  Padding(
  
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
  
                    child: Container(
  
                      decoration: BoxDecoration(
  
                        color:Colors.white,
  
        
  
                          border: Border(
  
                        left: BorderSide(width: 1, color: Colors.blueGrey),
  
                        right: BorderSide(width: 1, color: Colors.blueGrey),
  
                        top: BorderSide(width: 0.5, color: Colors.blueGrey),
  
                      bottom: BorderSide(width: 0.5, color: Colors.blueGrey),
  
                      )
  
                      ),
  
                      //   height:Get.height/14,
  
  
  
                      child: Row(
  
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
                        crossAxisAlignment: CrossAxisAlignment.start,
  
                        children: [
  
                          Container(
  
                            width: Get.width / 1.2,
  
                            child: ExpansionTile(
  
                              expandedAlignment: Alignment.topLeft,
  
                              expandedCrossAxisAlignment:
  
                                  CrossAxisAlignment.start,
  
                              title: Text(campName[i],
  
                                  style: TextStyle(
  
                                      color: Colors.black,
  
                                      fontSize: 15,
  
                                      fontWeight: FontWeight.bold)),
  
                              children: [
  
                                Padding(
  
                                  padding:
  
                                      const EdgeInsets.fromLTRB(20, 20, 0, 20),
  
                                  child: Row(
  
                                    mainAxisAlignment: MainAxisAlignment.start,
  
                                    crossAxisAlignment: CrossAxisAlignment.start,
  
                                    children: [
  
                                      Text("Mob:",
  
                                          style: TextStyle(
  
                                              color: Colors.black54,
  
                                              fontSize: 15)),
  
                                      Text(phoneNumber[i],
  
                                          style: TextStyle(
  
                                              fontSize: 15,
  
                                              fontWeight: FontWeight.bold,
  
                                              color: Colors.blueGrey)),
  
                                    ],
  
                                  ),
  
                                ),
  
                                Padding(
  
                                  padding:
  
                                      const EdgeInsets.fromLTRB(20, 0, 0, 20),
  
                                  child: Container(
                                //    width: Get.width / 1.6,
  
  
                                    child: Row(
  
                                      mainAxisAlignment: MainAxisAlignment.start,
  
                                      crossAxisAlignment:
  
                                          CrossAxisAlignment.start,
  
                                      children: [
  
                                        Text("Address:",
  
                                            style: TextStyle(
  
                                                color: Colors.black54,
  
                                                fontSize: 15)),
  
                                        Container(
   width: Get.width / 1.6,
  
                                         //   width: Get.width / 2.15,
  
                                            child: Text(
  
                                              campAddress[i],
  
                                                style: TextStyle(
  
                                                    fontSize: 15,
  
                                                    fontWeight: FontWeight.bold,
  
                                                    color: Colors.blueGrey))),
  
                                      ],
  
                                    ),
  
                                  ),
  
                                )
  
                              ],
  
                            ),
  
                          ),
  
                        
                      
                        ],
  
                      ),
  
                    ),)
  
    ],
  
  ),
)




    ],
  )


    );
  }
}