import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalproject/views/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DrawerMenuItems extends StatefulWidget {
  @override
  _DrawerMenuItemsState createState() => _DrawerMenuItemsState();
}

class _DrawerMenuItemsState extends State<DrawerMenuItems> {


  String email='';
    getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String emailid = await prefs.getString('userEmail');
    if (emailid != null) {
      setState(() {
        email = emailid;
      
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:Colors.red,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.account_circle_rounded,size:80,color:Colors.white),
                SizedBox(height:10),
                Text(email,style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold))
              ],
            )
            ),


InkWell(
  splashColor: Colors.blueGrey,
  onTap: (){

  },
  child:   Container(
  
    child: Padding(
  
     padding: const EdgeInsets.fromLTRB(8,12,8,12),
  
      child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
        children: [
  
          Text("Requested Hospital Services",style:TextStyle(color:Colors.black,fontSize:15,)),
  
          Icon(Icons.navigate_next,size:25,color:Colors.red)
  
        ],
  
      ),
  
    ),
  
  
  
    
  
  ),
),
 Divider(height:1,color:Colors.red)
,

InkWell(
  splashColor: Colors.blueGrey,
  onTap: (){

  },
  child:   Container(
  
    child: Padding(
  
    padding: const EdgeInsets.fromLTRB(8,12,8,12),
  
      child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
        children: [
  
          Text("Approved Hospital Services",style:TextStyle(color:Colors.black,fontSize:15,)),
  
          Icon(Icons.navigate_next,size:25,color:Colors.red)
  
        ],
  
      ),
  
    ),
  
  
  
    
  
  ),
),
 Divider(height:1,color:Colors.red)
,



InkWell(
  splashColor: Colors.blueGrey,
  onTap: (){

  },
  child:   Container(
  
    child: Padding(
   padding: const EdgeInsets.fromLTRB(8,12,8,12),
  
      child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
        children: [
  
          Text("Requested Doctors Appointment",style:TextStyle(color:Colors.black,fontSize:15,)),
  
          Icon(Icons.navigate_next,size:25,color:Colors.red)
  
        ],
  
      ),
  
    ),
  
  
  
    
  
  ),
),
 Divider(height:1,color:Colors.red)
,




InkWell(
  splashColor: Colors.blueGrey,
  onTap: (){

  },
  child:   Container(
  
    child: Padding(
  
     padding: const EdgeInsets.fromLTRB(8,12,8,12),
  
      child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
        children: [
  
          Text("Approved Doctors Appointment",style:TextStyle(color:Colors.black,fontSize:15,)),
  
          Icon(Icons.navigate_next,size:25,color:Colors.red)
  
        ],
  
      ),
  
    ),
  
  
  
    
  
  ),
),
 Divider(height:1,color:Colors.red)
,




InkWell(
  splashColor: Colors.blueGrey,
  onTap: (){

  },
  child:   Container(
  
    child: Padding(
  
    padding: const EdgeInsets.fromLTRB(8,12,8,12),
  
      child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
        children: [
  
          Text("Requested Ambulance Services",style:TextStyle(color:Colors.black,fontSize:15,)),
  
          Icon(Icons.navigate_next,size:25,color:Colors.red)
  
        ],
  
      ),
  
    ),
  
  
  
    
  
  ),
),
 Divider(height:1,color:Colors.red)
,





InkWell(
  splashColor: Colors.blueGrey,
  onTap: (){

  },
  child:   Container(
  
    child: Padding(
  
    padding: const EdgeInsets.fromLTRB(8,12,8,12),
  
      child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
        children: [
  
          Text("History",style:TextStyle(color:Colors.black,fontSize:15,)),
  
          Icon(Icons.navigate_next,size:25,color:Colors.red)
  
        ],
  
      ),
  
    ),
  
  
  
    
  
  ),
),
 Divider(height:1,color:Colors.red)
,





InkWell(
  splashColor: Colors.blueGrey,
  onTap: (){

  },
  child:   Container(
  
    child: Padding(
  
      padding: const EdgeInsets.fromLTRB(8,12,8,12),
   child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
        children: [
  
          Text("Profile Setting",style:TextStyle(color:Colors.black,fontSize:15,)),
  
          Icon(Icons.navigate_next,size:25,color:Colors.red)
  
        ],
  
      ),
  
    ),
  
  
  
    
  
  ),
),
 Divider(height:1,color:Colors.red)
,



InkWell(
  splashColor: Colors.blueGrey,
  onTap: (){
    Get.offAll(LoginScreen());
  },
  child:   Container(
  
    child: Padding(
  
      padding: const EdgeInsets.fromLTRB(8,12,8,12),
  
      child: Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
        children: [
  
          Text("Logout",style:TextStyle(color:Colors.black,fontSize:15,)),
  
          Icon(Icons.logout,size:25,color:Colors.red)
  
        ],
  
      ),
  
    ),
  
  
  
    
  
  ),
),
 Divider(height:1,color:Colors.red)
,



        ],
      )
    );
  }
}