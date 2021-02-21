import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class Api{

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();


  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));



  Future<Map> login(email, pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var exSessions = await prefs.getString('session_key');
    var session = exSessions != null ? exSessions : getRandomString(26);
    await prefs.setString('session_id', session);
    var response = await http.post(
        "https://g2mark.com/index.php?route=rest/login/login",
        body: jsonEncode(<String, String>{"email": email, 'password': pass}),
        headers: {
          'x-oc-merchant-id': 'JFVmjHD8faBjfjVcCZ73Sivfd7rpndd7',
          "X-Oc-Session": session,
          "Content-Type": "application/json",
          "Cache-Control": "max-age=0, no-cache, no-store",
          "Cookie": "language=en-gb; currency=INR; OCSESSID=" + session
        });

    if (response.statusCode == 200) {
      var jsonLoginInfo = json.decode(response.body);

      print(response.body);

      return jsonLoginInfo['data'];
    } else {
      print("email and password are not mateched");
    }
  }






  Future<Map> registerUser(
      fname, lname, email, mobileNumber, pass, confirmpass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var exSessions = await prefs.getString('session_key');
    var session = exSessions != null ? exSessions : getRandomString(26);
    await prefs.setString('session_id', session);
    var response = await http
        .post("https://g2mark.com/index.php?route=rest/register/register",
            body: jsonEncode(<String, String>{
              "firstname": fname,
              "lastname": lname,
              "email": email,
              "telephone": mobileNumber,
              'password': pass,
              "confirm": confirmpass,
              "agree": "1"
            }),
            headers: {
          'x-oc-merchant-id': 'JFVmjHD8faBjfjVcCZ73Sivfd7rpndd7',
          "X-Oc-Session": session,
          "Content-Type": "application/json",
          "Cache-Control": "max-age=0, no-cache, no-store",
          "Cookie": "language=en-gb; currency=INR; OCSESSID=" + session
        });

    print(response.body);
    var jsonRegisteredInfo = json.decode(response.body);
    if (response.statusCode == 200) {
      //  print(jsonRegisteredInfo);

      return jsonRegisteredInfo['data'];
    } else {
      print("this email is already registered");
    }
  }




}