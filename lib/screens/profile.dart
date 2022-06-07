import 'package:flutter/material.dart';
import 'package:task/models/get_profile_model.dart';

import '../data_provider/api_service.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ApiService apiService;
  bool isLoading=false;
  GetProfileModel? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService=ApiService();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<GetProfileModel?>(builder: (_,snapshot){
          if(snapshot.hasData){
            return customView(context, snapshot.data);
          }
          else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          return const Center(child: CircularProgressIndicator());
        },future: apiService.getProfileData(),),
      ),
    );
  }
}

Widget customView(BuildContext context, GetProfileModel? model) {
  return ListView.builder(
      itemCount: model?.data?.length??0,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage( model?.data?[index].avatar.toString()??"",),
                  radius: 30,
                ),
                SizedBox(
                  width: 18.0,
                ),
                Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      model?.data?[index].firstName.toString()??"",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      model?.data?[index].email.toString()??"",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 2,
              thickness: 2,
            )
          ],
        );
      });
}
