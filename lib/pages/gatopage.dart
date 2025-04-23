import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/components/custom_buttom_bar.dart';

class Gatopage extends StatefulWidget {
  const Gatopage({super.key});

  @override
  State<Gatopage> createState() => _GatopageState();
}

class _GatopageState extends State<Gatopage> {
  String? estadoGato;
  String? imagenGato;

  void observarGato() {
    final random = Random();
    final resultado = random.nextBool();

    setState(() {
      estadoGato = resultado ? '¡El gato está vivo!' : 'Oh no... el gato está muerto.';
      imagenGato = resultado ? 'assets/gato1.png' : 'assets/gato1.png';
    });
  }

  void reiniciar() {
    setState(() {
      estadoGato = null;
      imagenGato = null;
    });
  }

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
              'PARADOJA DEL GATO DE SCHRÖDINGER',
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
            const SizedBox(height: 20),
            if (estadoGato == null)
              Column(
                children: [
                  Text(
                    'Haz clic para abrir la caja y observar el estado del gato.',
                    style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: observarGato,
                    child: Image.asset('assets/caja.png', height: 200),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Image.asset(imagenGato ?? 'assets/gato.png', height: 250),
                  const SizedBox(height: 20),
                  Text(
                    estadoGato ?? '',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: reiniciar,
                    child: Text('Reiniciar'),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Text(
              'La paradoja del gato de Schrödinger muestra cómo la superposición cuántica desafía la lógica clásica. Hasta que se observe, el gato puede estar simultáneamente vivo y muerto.',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
