import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalproject/views/hospitalDetails.dart';


class HospitalServices extends StatefulWidget {
  @override
  _HospitalServicesState createState() => _HospitalServicesState();
}

class _HospitalServicesState extends State<HospitalServices> {

List<String>cancerHospitalName=[
"TATA Memorial Hospital, Mumbai",
"All Indial Institute of Medical Science, New Delhi",
"The Cancer Intiture, Adyar, Chennai",
"Apollo Speiciality Hospital, Chennai",
];
List<String>hUrl=[
"https://onco.com/chatbot/?flow=apptDirect&utm_source=google-search-oncobot-appt&utm_campaign=Geny-competition-panindia-tatamemorial&utm_medium=Hospital&utm_term=%2Btata%20%2Bhospital&campaignid=10013675210&adgroupid=100142321239&adid=459130716396&gclid=CjwKCAiAg8OBBhA8EiwAlKw3klJzaKAf0V017x_w288qYXwEw4RKyvwVW7uDjPD_Hh-lnmTcWKu3iBoCLloQAvD_BwE",
"",
"https://www.aiims.edu/en.html",
"http://www.cancerinstitutewia.in/CI-WIA/index.html",
"https://www.askapollo.com/physical-appointment/city/chennai"
];




List<String>description=[

"The Tata Memorial Hospital is situated in parel, Mumbai in inida. Also popularly known as TMH. it is a specialist cancer.Treatement and reserch center, closely associated with advanced center for tereatment."
,
"The All Indial Institute of Medical Science, New Delhi is situated in parel, Mumbai in inida. Also popularly known as TMH. it is a specialist cancer.Treatement and reserch center, closely associated with advanced center for tereatment."
,



"The The Cancer Intiture, Adyar, Chennai is situated in parel, Mumbai in inida. Also popularly known as TMH. it is a specialist cancer.Treatement and reserch center, closely associated with advanced center for tereatment."
,




"The Apollo Speiciality Hospital, Chennai is situated in parel, Mumbai in inida. Also popularly known as TMH. it is a specialist cancer.Treatement and reserch center, closely associated with advanced center for tereatment."
,


];



List<String>_images=[
  "images/tata.jpeg",
  "images/aims.jpeg",
  "images/apollo.jpeg",
  "images/chennai.jpeg"
];


List<String>_hospitals=[
"Cancer Hospital",
"Heart Hospitals",
"Eyes Hospitals",
"Others"
];





int selectedCategory=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle:true,
      title:Text("Hospital Services",style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold)),

actions: [
  Padding(
    padding: const EdgeInsets.only(right:20),
    child: IconButton(
      icon: Icon(Icons.search,size:25,color:Colors.white),
      onPressed:(){

      }
    ),
  )
],

elevation:0.0,

bottom: PreferredSize(
  preferredSize: Size.fromHeight(50),
child: Container(
  height:50,
  color:Colors.red,
child:ListView.builder(
  itemCount: _hospitals.length,
  scrollDirection: Axis.horizontal,
  itemBuilder: (BuildContext context,index){
    return Padding(
      padding: const EdgeInsets.only(left:10,bottom:10),
      child: InkWell(
        onTap: (){
          setState((){
            selectedCategory=index;
          });
        },
              child: Container(
          alignment: Alignment.center,
          height:Get.height/20,
        child:Text("  "+_hospitals[index]+" ",style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold)),
          decoration: BoxDecoration(
            border: Border.all(
              width:3,
              color:selectedCategory==index?Colors.green:Colors.transparent
            ),
            
            color:Colors.white,borderRadius:BorderRadius.circular(5)),
          
        ),
      ),
    );
})


),

),


      ),



body: selectedCategory==0?ListView.builder(
  itemCount: cancerHospitalName.length,
  itemBuilder: (BuildContext context, index){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15,15,15,0),
      child: InkWell(
        onTap: (){
          // Get.to(HospitalDetails(),
          // arguments: [
          //   cancerHospitalName[index],
          //   _images[index],

          // ]
          // );
          Navigator.push(
            context, MaterialPageRoute(
              builder:(_) =>HospitalDetails(
                title:cancerHospitalName[index],
                image:_images[index],
                url:hUrl[index],
                description:description[index],
              )
            )
          );
        },
              child: Container(
          height:Get.height/5,
child:Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
  Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
        height:Get.height/7,
        width:Get.width/4,
        decoration: BoxDecoration(
                boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
          ],
          image: DecorationImage(
            image: AssetImage(
              _images[index]
            ),
            fit: BoxFit.fill
          )
        ),
    ),
  ),


Container(
  width:Get.width/1.8,
  child: Text(cancerHospitalName[index],style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold)))

],
),


          decoration: BoxDecoration(
            boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
        ],
        color:Colors.white,
        borderRadius: BorderRadius.circular(20)
          ),
  
        ),
      ),
    );
  },
):Center(
child:Text("Currently unavailable",style:TextStyle(color:Colors.black54,fontSize:16,fontWeight:FontWeight.bold))
)



    );
  }
}