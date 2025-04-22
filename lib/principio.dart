import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Principio());
}

class Principio extends StatelessWidget {
  const Principio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.exo2TextTheme(), // Texto base: Exo 2
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            child: Image.asset(
              'assets/logo1.jpg',
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customButton('Accede al Portal', const Color(0xFFC6AFEF), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),

                  const SizedBox(height: 20),

                  customButton('Atomiza tu fusión', Colors.white, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(String text, Color bgColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: GoogleFonts.orbitron( // Orbitron para los botones
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),
    );
  }
}
