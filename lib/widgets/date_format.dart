import 'package:flutter/material.dart';
import 'package:study_kt_swift/extension/index.dart';

class DateFormat extends StatelessWidget {
  DateFormat({Key? key}) : super(key: key);
  DateTime now = DateTime.now();
  // DateTime? dtf = DateTimeFormat.tryParse("2019-1-1T1:3:5.5638175+08:00");
  DateTime? dtf = DateTimeFormat.tryParse("2022-01-09T00:47:22.535Z");
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("now Date: $now"),
        Text("now Date string: ${now.toString()}"),
        Text("now Date parse: ${now.format("YYYY年MM月DD日")}"),
        Text("当前 时间${now.format('HH:mm:ss')}"),
        Text("当前 时间戳${now.format('Z')}毫秒"),
        Text("当前 时间戳${now.format('ZZ')}微秒"),
        Text("dtf:${dtf?.format("YYYY年MM月DD日 HH:mm:ss.mss")}"),
        Text("dtf 当前${dtf?.month}月，有多少${dtf?.days}天"),
        Text("dtf 当前${dtf?.month}月，有多少${dtf?.days}天" r' cccss'),
      ],
    );
  }
}
