import 'package:flutter/material.dart';
import 'package:study_kt_swift/my_routes.dart';
import 'package:study_kt_swift/page_error/page_404.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Home(),
      initialRoute: MyRoutes.initialRoute,
      onGenerateRoute: (RouteSettings rs) {
        return PageRouteBuilder(
            settings: rs,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return MyRoutes.routes[rs.name]?.page(rs) ?? const Page404();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            });
      },
    );
  }
}
