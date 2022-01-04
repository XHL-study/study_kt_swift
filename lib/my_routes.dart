import 'package:flutter/material.dart';
import 'package:study_kt_swift/home/home.dart';
import 'package:study_kt_swift/page_error/page_404.dart';
import 'package:study_kt_swift/speech/speech.dart';
import 'package:study_kt_swift/tts/tts.dart';

typedef WidgetPage = Widget Function(RouteSettings rs);

class MyRoute {
  final String routeName;
  final String initTitle;
  final IconData? icon;
  final bool hidden;
  final WidgetPage page;
  MyRoute({
    required this.initTitle,
    required this.page,
    this.icon,
    this.hidden = false,
    required this.routeName,
  });
}

class MyRoutes {
  ///默认初始化的路由
  static String get initialRoute => Home.routeName;

  ///是否 隐藏路由
  static bool get _debugHiddenRoute => false;

  /// 路由
  static List<MyRoute> get _routes {
    return [
      MyRoute(
        routeName: Home.routeName,
        initTitle: '首页',
        icon: Icons.message,
        hidden: _debugHiddenRoute,
        page: (rs) => Home(
          rs: rs,
        ),
      ),
      MyRoute(
        routeName: Speech.routeName,
        initTitle: '测试 flutter speech',
        hidden: _debugHiddenRoute,
        icon: Icons.message,
        page: (rs) => Speech(
          rs: rs,
        ),
      ),
      MyRoute(
        routeName: TestTTS.routeName,
        initTitle: '测试 tts',
        icon: Icons.record_voice_over,
        page: (rs) => TestTTS(
          rs: rs,
        ),
      ),
      MyRoute(
        routeName: Page404.routeName,
        initTitle: 'page not found',
        icon: Icons.not_interested_rounded,
        page: (rs) => Page404(
          rs: rs,
        ),
      ),
    ];
  }

  /// 路由配置
  static Map<String, MyRoute> get routes {
    return Map.fromIterables(_routes.map((e) => e.routeName), _routes);
  }

  /// 菜单
  /// 过滤不需要显示的[MyRoute.hidden]
  static List<MyRoute> get menus {
    return _routes.where((MyRoute element) => !element.hidden).toList();
  }
}
