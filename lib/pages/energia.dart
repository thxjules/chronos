import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/components/custom_buttom_bar.dart';

class EnergiaPage extends StatelessWidget {
  const EnergiaPage({super.key});

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
                    border: Border.all(color: Color.fromARGB(255, 196, 157, 255), width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 112, 68, 255).withOpacity(0.4),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 196, 157, 255), size: 18),
                      const SizedBox(width: 4),
                      Text(
                        'Volver',
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 196, 157, 255),
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
              'CUANTO DE ENERGÍA',
              style: GoogleFonts.orbitron(
                fontSize: 24,
                color: Color.fromARGB(255, 196, 157, 255),
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    blurRadius: 10.0,
                    color: Color.fromARGB(255, 112, 68, 255),
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
                  'assets/energia.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'En el mundo cuántico, la energía no se distribuye de forma continua como ocurre a gran escala, sino que viene en paquetes indivisibles llamados cuantos. Esta idea fue introducida por Max Planck al estudiar la radiación emitida por los cuerpos calientes, y revolucionó la forma en que entendemos la energía.',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
