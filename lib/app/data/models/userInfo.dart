// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UserInfoModel {
  final String name;
  final IconData icon;
  final String data;

  const UserInfoModel({required this.name, required this.icon, required this.data});
}

List<UserInfoModel> userInfo = const [
  UserInfoModel( data: "butterfly.little@gmail.com", icon: Icons.mail, name: 'Email'),
  UserInfoModel( data: "+977-9815225566", icon: Icons.phone, name: 'Phone'),
  UserInfoModel( data:  "https://www.littlebutterfly.com", icon:  Icons.web, name: 'Website'),
];
