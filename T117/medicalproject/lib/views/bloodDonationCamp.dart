import 'package:flutter/material.dart';


class BloodDonationCampScreen extends StatefulWidget {
  @override
  _BloodDonationCampScreenState createState() => _BloodDonationCampScreenState();
}

class _BloodDonationCampScreenState extends State<BloodDonationCampScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Donation",style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold)),
      centerTitle: true,
      elevation: 0.0,
      ),


    );
  }
}