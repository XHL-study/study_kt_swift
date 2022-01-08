import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:study_kt_swift/widgets/date_format.dart';

/// 时间格式化 根据dayjs更改过来的简易版本
extension DateTimeFormat on DateTime {
  Map<String, dynamic> get _dateMap => {
        "YY": year.toString().substring(2),
        "YYYY": year,
        "M": month,
        "MM": DayUtil.preFixNum(month),
        // "MMM": month,
        //"MMMM": month,
        "D": day,
        "DD": DayUtil.preFixNum(day),
        //'d': day,
        //'dd': day,
        //'ddd': day,
        'H': hour,
        'HH': DayUtil.preFixNum(hour),
        'h': hour % 12,
        'hh': DayUtil.preFixNum(hour % 12),
        // 'a': hour,
        // 'A': hour,
        'm': minute,
        'mm': DayUtil.preFixNum(minute),
        's': second,
        'ss': DayUtil.preFixNum(second),
        // 'SSS': second,
        'ms': microsecond,
        'Z': millisecondsSinceEpoch,
        'ZZ': microsecondsSinceEpoch,
      };

  //  var matches = {
  //       YY: String(this.$y).slice(-2),
  //       YYYY: this.$y,
  //       M: $M + 1,
  //       MM: Utils.s($M + 1, 2, '0'),
  //       MMM: getShort(locale.monthsShort, $M, months, 3),
  //       MMMM: getShort(months, $M),
  //       D: this.$D,
  //       DD: Utils.s(this.$D, 2, '0'),
  //       d: String(this.$W),
  //       dd: getShort(locale.weekdaysMin, this.$W, weekdays, 2),
  //       ddd: getShort(locale.weekdaysShort, this.$W, weekdays, 3),
  //       dddd: weekdays[this.$W],
  //       H: String($H),
  //       HH: Utils.s($H, 2, '0'),
  //       h: get$H(1),
  //       hh: get$H(2),
  //       a: meridiemFunc($H, $m, true),
  //       A: meridiemFunc($H, $m, false),
  //       m: String($m),
  //       mm: Utils.s($m, 2, '0'),
  //       s: String(this.$s),
  //       ss: Utils.s(this.$s, 2, '0'),
  //       SSS: Utils.s(this.$ms, 3, '0'),
  //       Z: zoneStr // 'ZZ' logic below
  //     };

  /// format [DateTime] to string
  String format(String formatStr) {
    // if (formatStr.isEmpty) throw DateTimeFormatException('formatStr is null');
    return formatStr.replaceAllMapped(DayUtil.regexpFormat, (Match match) {
      return _dateMap[formatStr.substring(match.start, match.end)].toString();
    });
  }

  /// tryFormat [DateTime] to string
  // String tryFormat(String formatStr) {
  //   try {
  //     return format(formatStr);
  //   } on DateTimeFormatException catch (e) {
  //     return e.toString();
  //   }
  // }

  /// get date week
  int getWeek() {
    return weekday;
  }
}

class DayUtil {
  //format regex
  static final RegExp regexpFormat = RegExp(
      r"\[([^\]]+)]|Y{1,4}|M{1,4}|D{1,2}|d{1,4}|H{1,2}|h{1,2}|a|A|\bms\b|m{1,2}|s{1,2}|Z{1,2}|SSS");

  //增加数字前缀
  static dynamic preFixNum(
    int num, {
    int preFixLen = 2,
    String preFix = '0',
  }) {
    if (num.toString().length > preFixLen) return num;
    return List.generate(preFixLen - num.toString().length, (index) => preFix)
            .join('') +
        num.toString();
  }
}

// class DateTimeFormatException implements Exception {
//   final String message;
//   final int code;
//
//   DateTimeFormatException(this.message, {this.code = -1});
//
//   @override
//   String toString() {
//     return 'message:$message code:$code';
//   }
// }
