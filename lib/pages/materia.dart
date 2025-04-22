import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/components/custom_buttom_bar.dart';

class MateriaPage extends StatelessWidget {
  const MateriaPage({super.key});

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
                      Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 255, 253, 157), size: 18),
                      const SizedBox(width: 4),
                      Text(
                        'Volver',
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 255, 217, 157),
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
              'MATERIA OSCURA',
              style: GoogleFonts.orbitron(
                fontSize: 24,
                color: Color.fromARGB(255, 255, 255, 157),
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    blurRadius: 10.0,
                    color: Color.fromARGB(255, 255, 215, 68),
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
                  'assets/materia.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'En astrofísica, se conoce como materia oscura a un componente del universo distinto de la llamada materia bariónica (materia ordinaria), de los neutrinos y de la energía oscura. Su nombre proviene del hecho de que no emite ni interactúa de ninguna forma con la radiación electromagnética y es, por lo tanto, invisible en todo el espectro de la radiación electromagnética.', 
             style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
