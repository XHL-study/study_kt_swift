/// 时间格式化 根据dayjs更改过来的简易版本

///  格式化字典 部分未实现
///  var matches = {
///     YY: String(this.$y).slice(-2),
///     YYYY: this.$y,
///     M: $M + 1,
///     MM: Utils.s($M + 1, 2, '0'),
///     MMM: getShort(locale.monthsShort, $M, months, 3),
///     MMMM: getShort(months, $M),
///     D: this.$D,
///     DD: Utils.s(this.$D, 2, '0'),
///     d: String(this.$W),
///     dd: getShort(locale.weekdaysMin, this.$W, weekdays, 2),
///     ddd: getShort(locale.weekdaysShort, this.$W, weekdays, 3),
///     dddd: weekdays[this.$W],
///     H: String($H),
///     HH: Utils.s($H, 2, '0'),
///     h: get$H(1),
///     hh: get$H(2),
///     a: meridiemFunc($H, $m, true),
///     A: meridiemFunc($H, $m, false),
///     m: String($m),
///     mm: Utils.s($m, 2, '0'),
///     s: String(this.$s),
///     ss: Utils.s(this.$s, 2, '0'),
///     SSS: Utils.s(this.$ms, 3, '0'),
///     Z: zoneStr // 'ZZ' logic below
///   };

extension DateTimeFormat on DateTime {
  Map<String, dynamic> get _dateMap => {
        "YY": year.toString().substring(2),
        "YYYY": year,
        "M": month,
        "MM": DayUtil.preFixNum(month),
        "D": day,
        "DD": DayUtil.preFixNum(day),
        'H': hour,
        'HH': DayUtil.preFixNum(hour),
        'h': hour % 12,
        'hh': DayUtil.preFixNum(hour % 12),
        'm': minute,
        'mm': DayUtil.preFixNum(minute),
        's': second,
        'ss': DayUtil.preFixNum(second),
        'ms': millisecond,
        'mss': DayUtil.preFixNum(millisecond, preFixLen: 3),
        'Z': millisecondsSinceEpoch, //时间戳 毫秒
        'ZZ': microsecondsSinceEpoch, //时间戳 微秒
      };

  /// format [DateTime] to string
  String format(String formatStr) {
    return formatStr.replaceAllMapped(DayUtil.regexpFormat, (Match match) {
      return _dateMap[formatStr.substring(match.start, match.end)].toString();
    });
  }

  /// format [fms] to DateTime？
  static DateTime? tryParse(String fms) {
    try {
      final fs = fms.replaceAllMapped(DayUtil.regexpTimeNum, (Match match) {
        return DayUtil.preFixNum(fms.substring(match.start, match.end));
      });
      return DateTime.parse(fs);
    } on FormatException {
      return null;
    }
  }

  /// 获取 当前月 有多少天
  int get days => DateTime(year, month + 1, 0).day;
}

class DayUtil {
  //格式化 日期 正则
  static final RegExp regexpFormat = RegExp(
      r"\[([^\]]+)]|Y{1,4}|M{1,4}|D{1,2}|d{1,4}|H{1,2}|h{1,2}|a|A|\bmss\b|\bms\b|m{1,2}|s{1,2}|Z{1,2}|SSS");

  /// 日期 数字匹配 正则
  static final RegExp regexpTimeNum = RegExp(r'\d+');

  //增加 数字前缀
  static dynamic preFixNum(
    dynamic num, {
    int preFixLen = 2,
    String preFix = '0',
  }) {
    if (num.toString().length > preFixLen) return num;
    return List.generate(preFixLen - num.toString().length, (index) => preFix)
            .join('') +
        num.toString();
  }
}
