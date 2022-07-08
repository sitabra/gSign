import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:practice_set/model/user_model.dart';

import '../common/apiConstants.dart';

class ApiService {
 Future getDetails() async{
   var url =
   Uri.https('reqres.in', '/api/users',{"page":"2"});

   // Await the http get response, then decode the json-formatted response.
   var response = await http.get(url);
   if (response.statusCode == 200) {
     if (kDebugMode) {
       print(response.body.toString());
       return Users.fromJson(jsonDecode(response.body));
     }
   } else {

   }
 }
}
