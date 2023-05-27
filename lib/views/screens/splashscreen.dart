import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(
        seconds: 5,
      ),
      () => Navigator.of(context).pushReplacementNamed('/'),
    );
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/img_1.png",
            ),
          ],
        ),
      ),
    );
  }
}
