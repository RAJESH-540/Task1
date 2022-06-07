import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task/data_provider/api_service.dart';
import 'package:task/models/create_user.dart';
import 'package:task/routes/route.gr.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
final form = GlobalKey<FormState>();
 final nameController = TextEditingController();
 final jobController= TextEditingController();



class _LoginState extends State<Login> {
   final apiService= ApiService();
   final  model= PostProfileModel();


  @override
  Widget build(BuildContext context) {
    return Form(
       key: form,
      child: Scaffold(
        appBar: AppBar(
        ),
         body: SafeArea(
           child: Padding(
             padding: const EdgeInsets.all(26.0),
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const  Text("Name"),
                   const SizedBox(height: 8.0),
                   TextFormField(
                     textInputAction: TextInputAction.next,
                     controller: nameController,
                      onSaved: (val){
                      val= nameController.toString();
                      },
                     decoration:  InputDecoration(
                       focusedBorder: const OutlineInputBorder(
                         borderSide: BorderSide( color: Colors.blueAccent,width: 1.0),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8)
                       ),

                     ),
                   ),
                  const SizedBox(height: 12.0),
                  const  Text("Job"),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    onSaved: (val){
                      val= jobController.toString();
                        // val= model.name.toString();
                    },
                    controller: jobController,
                    decoration:  InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8)
                      ),

                    ),
                  ),
                   const SizedBox(height: 450,),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                           minimumSize: const Size(100, 50)
                         ),
                          onPressed: () {
                            if(form.currentState!.validate()){
                              apiService.createProfile(nameController.text, jobController.text);
                              context.router.push(Profile());

                            }
                          }
                          , child: Text("Submited"))),
                    ],
                  ),
                ],
             ),
           ),
         ),
      ),
    );
  }
}
