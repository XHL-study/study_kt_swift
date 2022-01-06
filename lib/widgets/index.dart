import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:study_kt_swift/my_routes.dart';
import 'package:study_kt_swift/widgets/date_format.dart';
import 'package:study_kt_swift/widgets/select_file.dart';

class WidgetsIndex extends StatefulWidget {
  static const String routeName = '/widgets/index';
  final RouteSettings? rs;

  const WidgetsIndex({Key? key, this.rs}) : super(key: key);

  @override
  _WidgetsIndexState createState() => _WidgetsIndexState();
}

class _WidgetsIndexState extends State<WidgetsIndex> {
  String? file;
  MultipartFile? mf;

  void openSelectFileWindow(File _file) async {
    print("file :$_file");
    setState(() {
      file = _file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((widget.rs?.arguments as MyRoute).initTitle),
      ),
      body: Column(
        children: [
          SelectFile(openSelectFileWindow),
          Container(width: double.infinity,color: Colors.red.shade50,padding:const EdgeInsetsDirectional.all(4.0),),
          Text(file ?? "未选择文件"),
          Container(width: double.infinity,color: Colors.red.shade50,padding:const EdgeInsetsDirectional.all(4.0),),
          DateFormat(),
          Container(width: double.infinity,color: Colors.red.shade50,padding:const EdgeInsetsDirectional.all(4.0),),
        ],
      ),
    );
  }
}
