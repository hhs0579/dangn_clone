import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/a.png'),
            CircularProgressIndicator(
              color:Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}