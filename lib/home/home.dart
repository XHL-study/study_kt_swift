import 'package:flutter/material.dart';

import '../my_routes.dart';

class Home extends StatefulWidget {
  static const String routeName = '/';
  final RouteSettings? rs;
  const Home({Key? key, this.rs}) : super(key: key);

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  _menuClick(MyRoute mr) {
    Navigator.of(context).pushNamed(mr.routeName, arguments: mr);
  }

  MyRoute? mr;

  @override
  void initState() {
    super.initState();
    mr = widget.rs?.arguments as MyRoute?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mr?.initTitle ?? "首页"),
      ),
      body: ListView.builder(
          itemCount: MyRoutes.menus.length,
          itemBuilder: (BuildContext context, int index) {
            MyRoute mr = MyRoutes.menus[index];
            return ListTile(
              title: Text(mr.initTitle),
              leading: Icon(mr.icon),
              onTap: () {
                _menuClick(mr);
              },
            );
          }),
    );
  }
}
