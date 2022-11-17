import 'dart:async';

import 'package:flutter/material.dart';

class spacshScreen extends StatefulWidget {
  const spacshScreen({Key? key}) : super(key: key);

  @override
  State<spacshScreen> createState() => _spacshScreenState();
}

class _spacshScreenState extends State<spacshScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/');    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "asserts/image/newss.png",
                  height: 250,
                  width: 250,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),);
  }
}
