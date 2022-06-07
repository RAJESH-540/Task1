import 'dart:convert';

PostProfileModel postProfileModelFromJson(String str) => PostProfileModel.fromJson(json.decode(str));

String postProfileModelToJson(PostProfileModel data) => json.encode(data.toJson());

class PostProfileModel {
  PostProfileModel({
    this.name,
    this.job,
  });

  String? name;
  String? job;

  factory PostProfileModel.fromJson(Map<String, dynamic> json) => PostProfileModel(
    name: json["name"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
  };
}
