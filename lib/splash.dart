import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'firstpage.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    gonext();
  }

  gonext() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }

    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // alignment: Alignment.center,
        // height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("shayriimages/img_5.png"),
                fit: BoxFit.contain),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

/*@override
  void initState() {
    super.initState();

    gonext();
  }

  gonext() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
  }*/
}
