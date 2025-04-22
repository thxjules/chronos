import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'principio.dart'; 
void main() {
  runApp(const Pag2());
}

class Pag2 extends StatelessWidget {
  const Pag2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.exo2TextTheme(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          Positioned.fill(
            top: 80,
            child: Image.asset(
              'assets/logo2.png', // Asegúrate de tener esta imagen en assets y declarada en pubspec.yaml
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      'Explora un viaje interactivo lleno de misterios, acertijos y decisiones que darán forma a tu destino. Chronos es una app movil diseñada especialmente para ti, donde podrás resolver acertijos cuanticos, coaliciones espaciales y más. Atrevete a descubrir el universo',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  customButton('Empieza la travesía', const Color(0xFFC6AFEF), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Principio()),
                    );
                  }),
                  const SizedBox(height: 20),
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
        textStyle: GoogleFonts.orbitron(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),
    );
  }
}
