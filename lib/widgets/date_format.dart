import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_kt_swift/extension/index.dart';

class DateFormat extends StatelessWidget {
  DateFormat({Key? key}) : super(key: key);
  DateTime now = DateTime.now();
  DateTime? dtf = DateTime.tryParse("2021-12-12 15:30:36.232");
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("now Date: $now"),
        Text("now Date string: ${now.toString()}"),
        Text("now Date parse: ${now.format("YYYY年MM月DD日")}"),
        Text("当前 时间戳${now.format('Z')}秒"),
        Text("当前 时间${now.format('h:m:s')}秒"),
        Text("当前 时间戳${now.format('ZZ')}微秒"),
        Text("dtf:${dtf?.format("YYYY年MM月DD日")}")
      ],
    );
  }
}
