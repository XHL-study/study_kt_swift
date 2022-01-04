import 'package:flutter/material.dart';
import 'package:study_kt_swift/my_routes.dart';

class Page404 extends StatelessWidget {
  static String routeName = '/404';
  final RouteSettings? rs;
  const Page404({Key? key, this.rs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text((rs?.arguments as MyRoute).initTitle)),
      body: const Center(
        child: Text("notFound page 404"),
      ),
    );
  }
}
