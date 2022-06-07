import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task/models/get_profile_model.dart';

import '../models/create_user.dart';

class ApiService{
  final Dio _dio = Dio();

 Future<GetProfileModel?> getProfileData() async{
    try {
      Response response= await _dio.get("https://reqres.in/api/users?page=2");
       if(response.statusCode==200){
          return getProfileModelFromJson(jsonEncode(response.data));
       }
    } catch (e) {
      print(e);
    }
    return null;


 }


 Future<PostProfileModel?> createProfile( String name, String job) async{
    try {
      Response response = await _dio.post("https://reqres.in/api/users",
              data:{
             "name":name.toString(),
                "job":job.toString(),

              } );
      return response.data;
    } catch (e) {
      print(e);
    }

 }





}