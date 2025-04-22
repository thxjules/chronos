import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/components/custom_buttom_bar.dart';

class DesencriptacionPage extends StatelessWidget {
  const DesencriptacionPage({super.key});

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
              'DESENCRIPTACIÓN',
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
                  'assets/desencriptacion.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'La desencriptación cuántica se refiere al uso de tecnologías basadas en mecánica cuántica para descifrar códigos o sistemas de encriptación tradicionales. En el corazón de esta idea está la computación cuántica, que utiliza qubits en lugar de bits clásicos. A diferencia de los bits tradicionales, que solo pueden ser 0 o 1, los qubits pueden estar en múltiples estados a la vez gracias al principio de superposición',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
