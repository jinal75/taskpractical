import 'dart:convert';

import 'package:http/http.dart';
import 'package:taskapp/model/Categorylist.dart';




class Apiclass{
  String BASEURL = " http://jewellery.techcelerity.com/";
 String categorylist="api/get-menu";
String login="admin/login";


  Future<dynamic> LoginCheck(String username, String password, String Role) async {
    try{
      final Response response = await post(
        Uri.parse('$BASEURL$login'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: <String, dynamic>{'username': username, 'password': password,'reg_select_role':Role},);
      var data = jsonDecode(response.body);
      if (data['status']) {
        return data;
      }
      else {
        return data;
      }
    }catch(_){
      return {
        "status" : false,
        "Message" : "Exceptions occurred"
      };



    }
  }
  Future<Categorylist> getcategorylist() async{

    Response res = await get(Uri.parse('http://jewellery.techcelerity.com/api/get-menu'),
        // headers: <String ,String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // }
        );
    print('$BASEURL$categorylist');
    print(res.statusCode);
    if(res.statusCode==200){
      print(res.statusCode);
      return Categorylist.fromJson(json.decode(res.body));
    }else{
      throw 'datanot retrive';
    }


  }





}