import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  double tamanio = 50;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        tamanio = 140;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade200,
              Colors.purple.shade100,
            ],
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              AnimatedContainer(
                duration: Duration(seconds: 1),

                child: Icon(
                  Icons.menu_book,
                  size: tamanio,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Biblioteca Escolar",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
