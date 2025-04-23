import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/components/custom_buttom_bar.dart';

class MultiversoPage extends StatefulWidget {
  const MultiversoPage({super.key});

  @override
  State<MultiversoPage> createState() => _MultiversoPageState();
}

class _MultiversoPageState extends State<MultiversoPage> {
  String? universoResultado;
  String? universoImagen;

  final List<Map<String, String>> universos = [
    {
      'texto': 'En este universo, la gravedad es repulsiva. Todo flota eternamente.',
      'imagen': 'assets/multiverso_1.png',
    },
    {
      'texto': 'Aquí, los gatos gobiernan el mundo y caminan sobre dos patas.',
      'imagen': 'assets/multiverso_2.png',
    },
  ];

  void explorarMultiverso() {
    final random = Random();
    final universo = universos[random.nextInt(universos.length)];

    setState(() {
      universoResultado = universo['texto'];
      universoImagen = universo['imagen'];
    });
  }

  void reiniciar() {
    setState(() {
      universoResultado = null;
      universoImagen = null;
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
                    border: Border.all(color: Color(0xFFC49DFF), width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF7044FF).withOpacity(0.4),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back_ios_new, color: Color(0xFFC49DFF), size: 18),
                      const SizedBox(width: 4),
                      Text(
                        'Volver',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFC49DFF),
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
              'MULTIVERSO',
              style: GoogleFonts.orbitron(
                fontSize: 24,
                color: Color(0xFFC49DFF),
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    blurRadius: 10.0,
                    color: Color(0xFF7044FF),
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (universoResultado == null)
              Column(
                children: [
                  Text(
                    'Selecciona un portal para explorar una realidad paralela.',
                    style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(2, (index) {
                      return GestureDetector(
                        onTap: explorarMultiverso,
                        child: Image.asset('assets/portal.png', width: 150),
                      );
                    }),
                  ),
                ],
              )
            else
              Column(
                children: [
                  if (universoImagen != null)
                    Image.asset(universoImagen!, height: 250, fit: BoxFit.contain),
                  const SizedBox(height: 20),
                  Text(
                    universoResultado ?? '',
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: reiniciar,
                    child: Text('Explorar otro universo'),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Text(
              'El multiverso es una hipótesis fascinante que plantea la existencia de múltiples realidades posibles, coexistiendo con la nuestra pero inaccesibles… ¿o tal vez no?',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
