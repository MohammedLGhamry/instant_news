import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
            () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(),
          ),
              (route) => false,
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'News',
            style: TextStyle(
              color: Color(0xFF2D5BD0),
              fontWeight: FontWeight.w600,
              fontSize: 64,
              letterSpacing: 4
            )
        ),
      ),
    );
  }
}
