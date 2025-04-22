import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/components/custom_buttom_bar.dart';

class Gatopage extends StatelessWidget {
  const Gatopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CustomBottomBar(
        onHomeTap: () => Navigator.pushNamed(context, '/inicio'),
        onAtomTap: () => Navigator.pushNamed(context, '/conceptos'),
        onStarTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/conceptos'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF9DCBFF), width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.4),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back_ios_new, color: Color(0xFF9DCBFF), size: 18),
                      const SizedBox(width: 4),
                      Text(
                        'Volver',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF9DCBFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'PARADOJA DEL GATO DE SCHöDINGER',
              style: GoogleFonts.orbitron(
                fontSize: 24,
                color: Color(0xFF9DCBFF),
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueAccent,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 250,
                child: Image.asset(
                  'assets/gato.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'La paradoja del gato de Schrödinger es un experimento mental que plantea que un gato dentro de una caja puede estar simultáneamente vivo y muerto hasta que se observe. Es una forma de ilustrar cómo la superposición cuántica desafía nuestra intuición clásica.',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
